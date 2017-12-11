class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :products, -> { find_products }

  def new
    @order = current_user.orders.new
    @order.status = "Created"
    @ordered_products = []

    session[:cart].each do |id|
      @ordered_products << OrderedProduct.new(
        product_id: id, order_id: @order.id)
    end
  end

  def index
    @orders = current_user.orders.all
  end

  private

  def find_products
    Product.where id: session[:cart]
  end
  # def init_order
  #   order = current_user.orders.create status: "in_progress"
  #   order.products << Product.where(id: session[:cart])
  # end

  # def empty_cart
  #   session[:cart] = []
  # end
end
