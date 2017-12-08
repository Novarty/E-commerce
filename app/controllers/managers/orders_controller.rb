class Managers::OrdersController < ApplicationController
  before_action :authenticate_manager!

  expose_decorated :ordered_products, -> { OrderProduct.all }
  expose_decorated :ordered_product

  def index
    respond_with :manager, ordered_products
  end

  def show
    
  end

end
