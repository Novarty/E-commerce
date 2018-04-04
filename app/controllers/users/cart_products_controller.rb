class Users::CartProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_cart

  expose_decorated :products, -> { find_products }

  def index; end

  def new
    session[:cart] << params[:product_id] if Product.find_by(id: params[:product_id])

    session[:cart].uniq!

    redirect_back fallback_location: root_path, notice: 'Продукт был добавлен в корзину'
  end

  def destroy
    session[:cart].delete(params[:id])

    redirect_back fallback_location: root_path, notice: 'Продукт был удален из корзины'
  end

  private

  def find_products
    Product.where id: session[:cart]
  end

  def init_cart
    session[:cart] = [] unless session[:cart]
  end
end
