class ClientservicesController < ApplicationController
  def new
    @clientservice = Clientservice.new
    @salon = Salon.find(params[:salon_id])
    @salon_services = @salon.services
    @salon_stylists = []
    @salon.users.each do |s|
      if s.user_type == 'stylist'
        @salon_stylists << s
      end
    end
  end

  def create
    binding.pry
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

  private

  def appt_params
    params.require(:clientservice).permit(:service, :stylist, :datetime)
  end
end
