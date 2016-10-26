class StylistserviceController < ApplicationController

  def new
    @service = Service.find(params[:format])
    @user = current_user
    @user.services << @service
  end

  def destroy
    @service = Service.find(params[:id])
    
  end
end
