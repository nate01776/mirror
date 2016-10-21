class ServicesController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @service = @salon.services.find(params[:id])
  end

  def new
    @salon = Salon.find(params[:salon_id])
    @service = Service.new
    @service_types = Service::SERVICE_TYPES
  end

  def create
    @salon = Salon.find(params[:salon_id])
    @service = Service.new(service_params)
    @service.salon = @salon
    if @service.save
      redirect_to salon_path(@salon.id)
      flash[:notice] = "Service added successfully"
    else
      flash[:notice] = @service.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :service_type)
  end
end
