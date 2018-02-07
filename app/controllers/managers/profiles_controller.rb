class Managers::ProfilesController < ApplicationController
  before_action :authenticate_manager!
  expose_decorated :profile, -> { set_profile }

  def show; end

  private

  def set_profile
    Manager.find(params[:id])
  end
end
