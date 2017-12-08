class Users::CartsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    session[:cart] = []

    redirect_back fallback_location: root_path, notice: "Корзина была очищена"
  end
end
