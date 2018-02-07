class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  expose_decorated :profile, -> { set_profile }

  def show; end

  private

  def set_profile
    User.find(params[:id])
  end
end
