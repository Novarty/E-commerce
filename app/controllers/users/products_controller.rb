class Users::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose :products, ->{ Product.all }
  expose :product

  def index; end

  def show; end
end
