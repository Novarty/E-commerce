class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :orders, from: :current_user
  expose_decorated :order

  def index; end

  def new
    @order = current_user.orders.new
    @ordered_products = []

    session[:cart].each do |id|
      @ordered_products << OrderedProduct.new(product_id: id)
    end
  end

  def show; end

  def create
    @order = current_user.orders.new(order_params.merge(status: "created"))
    if @order.save
      session[:cart] = []
      redirect_to [:users, @order], notice: 'Order was successfully created.'
    else
      render :new
    end
  end


  private

  def order_params
    params.require(:order).permit(
      :user_id,
      :status,
      ordered_products_attributes: [ :product_id, :order_id,  :amount, :_destroy ]
    )
  end
end
