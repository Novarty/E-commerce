class OrdersController < ApplicationController

  expose :order
  expose :orders, -> {Order.all}
  expose :product
  def index; end

  def show; end

  def new; end

  def create

  end
end
