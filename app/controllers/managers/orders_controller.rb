class Managers::OrdersController < ApplicationController
  before_action :authenticate_manager!

  # expose_decorated :ordered_products, -> { OrderProduct.all }
  # expose_decorated :ordered_product

  expose_decorated :orders, -> { Order.all }

  def index; end

  def show; end

  def edit; end

  def update
    @order = Order.update(order_params)
    @order.save
  end

  def order_params
    params.require(:order).permit(
      :user_id,
      :status,
      ordered_products_attributes: %i[product_id order_id amount _destroy]
    )
  end
end
