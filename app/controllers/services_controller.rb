class ServicesController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @service = @salon.services.find(params[:id])
  end

  def new
    @salon = Salon.find(params[:salon_id])
    @user = current_user
    if @user.id != @salon.owner_id
      redirect_to root_path
    end
    @service = Service.new
    @service_types = Service::SERVICE_TYPES
  end

  def create
    @salon = Salon.find(params[:salon_id])
    @user = current_user
    if @user.id != @salon.owner_id
      redirect_to root_path
    end
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

  def destroy
    @user = current_user
    @salon = Salon.find(params[:salon_id])
    @service = Service.find(params[:id])
    if @user.user_type != "owner" || @salon.owner_id != @user.id
      redirect_to root_path
      flash[:notice] = "You do not have authorization to perform this action!"
    end
    @service.destroy
    flash[:notice] = 'Service was successfully deleted'
    redirect_to salon_path(@salon.id)
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :service_type, :price, :time)
  end
end
