class StylistserviceController < ApplicationController
  def new
    @service = Service.find(params[:format])
    @user = current_user
    @user.services << @service
    redirect_to salon_path(params[:salon_id])
  end

  def destroy
    @user = current_user
    @service_to_delete = @user.services.find(params[:id])
    @stylistservices = Stylistservice.find_by(service_id: @service_to_delete.id)
    Clientservice.all.each do |service|
      if service.stylistservice_id == @stylistservices.id
        Clientservice.delete(service.id)
      end
    end
    @user.services.delete(params[:id])
    redirect_to salon_path(params[:salon_id]) 
  end
end
