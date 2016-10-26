class StylistserviceController < ApplicationController
  def new
    @service = Service.find(params[:format])
    @user = current_user
    @user.services << @service
  end

  def destroy
    @user = current_user
    @user.services.delete(params[:id])
  end
end
