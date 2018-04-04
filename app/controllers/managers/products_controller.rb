class Managers::ProductsController < ApplicationController
  before_action :authenticate_manager!, except: %i[index show]

  expose_decorated :products, -> { init_products }
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

  def init_products
    products = Product.all
    products = products.where('name ILIKE ?', "%#{params[:search]}%") if params[:search]
    products # returns
  end

  def product_params
    params.require(:product).permit(
      :name,
      :avatar,
      :amount,
      :price,
      :description
    )
  end
end
