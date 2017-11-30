class Managers::ProductsController < ApplicationController
  before_action :authenticate_manager!, except: [:index, :show]

  expose_decorated :products, ->{ Product.all }
  expose_decorated :product

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    product.manager = current_manager
    product.save
    respond_with :managers, product
  end

  def update
    product.update(product_params)
    respond_with :managers, product
  end

  def destroy
    product.destroy
    respond_with :managers, product
  end

  private

    def product_params
      params.require(:product).permit(:name, :amount, :price, :description)
    end
end
