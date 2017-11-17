class Managers::ProductsController < ApplicationController
  before_action :authenticate_manager!, except: [:index, :show]

  expose :products, ->{ Product.all }
  expose :product

  def index
    # respond_with products
  end

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
      params.require(:product).permit(:name, :amount)
    end
end
