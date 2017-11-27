class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    init_order
    empty_cart

    redirect_to users_orders_path
  end

  def index
  end

  private

  def init_order
    order = current_user.orders.create status: "in_progress"
    order.products << Product.where(id: session[:cart])
  end

  def empty_cart
    session[:cart] = []
  end
end
