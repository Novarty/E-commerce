class Users::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose :products, ->{ init_products }
  expose :product

  def index; end

  def show; end

  private

  def init_products
    Product.where("amount > '0'")
  end
end
