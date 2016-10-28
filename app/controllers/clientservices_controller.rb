class ClientservicesController < ApplicationController
  def new
    @clientservice = Clientservice.new
    @salon = Salon.find(params[:salon_id])
    @salon_services = @salon.services
    @salon_stylists = []
    @salon.users.each do |s|
      if s.is_stylist?
        to_push = {
          :stylist => nil,
          :services => nil }
        to_push[:services] = s.services
        to_push[:stylist] = s
        @salon_stylists << to_push
      end
    end

    gon.salon_stylists = @salon_stylists
    gon.salon_services = @salon_services
  end

  def create
    @new_service = Clientservice.new(appt_params)
    @new_service.user_id = current_user.id
    stylist = User.find(params[:clientservice][:stylist_id])
    service = stylist.services.find_by(name: params[:clientservice][:service_id])
    stylistservice = Stylistservice.find_by(service_id: service.id, user_id: stylist.id)
    @new_service.save
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
    params.require(:clientservice).permit(:stylist_id, :datetime)
  end
end
