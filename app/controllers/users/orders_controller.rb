class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :products, -> { find_products }
  # expose :order, ->{current_user.orders.new(status: "Created", user: current_user)}

  def new
    @order = current_user.orders.new(status: "Created", user: current_user)
    @ordered_products = []

    session[:cart].each do |id|
      @ordered_products << OrderedProduct.new(product_id: id)
    end
  end

  def index
    @orders = current_user.orders.all
  end

  def create
    @order = Order.create(order_params)
    @order.status = "in_progress"
    if @order.save
      session[:cart] = []
      redirect_to order, notice: 'Order was successfully updated.'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def find_products
    Product.where id: session[:cart]
  end

  def order_params
    params.require(:order).permit(
      :user_id,
      :status,
      ordered_products_attributes: [ :product_id, :order_id,  :amount, :_destroy ]
    )
  end
end
