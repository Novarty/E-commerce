class Users::ProductsController < ApplicationController
  expose :products, ->{ Product.all }
  expose :product
  
  def index; end

  def show; end
end
