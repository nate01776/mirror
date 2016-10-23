class SalonsController < ApplicationController
  def new
    @salon = Salon.new
  end

  def show
    @user = current_user
    @salon = Salon.find(params[:id])
    #insert info to say that user who is owner can see this data
    @services = @salon.services
    @products = @salon.products
    @members = @salon.users
    @stylists = @salon.find_stylists(@members)
    @clients = @salon.find_clients(@members)
  end

  def create
    @salon = Salon.new(salon_params)
    @salon.owner_id = current_user.id
    if @salon.save
      redirect_to root_path
      flash[:notice] = "Salon added successfully"
    else
      flash[:notice] = @salon.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @salon = Salon.find(params[:id])
  end

  def update
    @salon = Salon.find(params[:id])
    @salon.update_attributes(salon_params)
    if @salon.save
      redirect_to root_path
    else
      render action: 'edit'
    end
  end

  private

  def salon_params
    params.require(:salon).permit(:name, :address, :city, :state, :zip_code, :neighborhood, :phone, :email, :owner, :open_chair_count)
  end
end
