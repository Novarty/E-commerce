class Users::ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose_decorated :products, -> { init_products }
  expose_decorated :product

  def index; end

  def show; end

  private

  def init_products
    products = Product.where("amount > '0'")
    products = products.where('name ILIKE ?', "%#{params[:search]}%") if params[:search]
    products.page(params[:page]) # returns
  end
end
