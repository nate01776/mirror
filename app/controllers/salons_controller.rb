class SalonsController < ApplicationController
  def new
    @salon = Salon.new
  end

  def show
    @user = current_user
    @salon = Salon.find(params[:id])
    @services = @salon.services
    @products = @salon.products
    @members = @salon.users
    @stylists = @salon.find_stylists(@members)
    @clients = @salon.find_clients(@members)
    @is_owner = false
    if @user.id == @salon.owner_id
      @is_owner = true
    end
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
    @user = current_user
    if @user.id != @salon.owner_id
      redirect_to root_path
    end
    @image = @salon.image
  end

  def update
    @salon = Salon.find(params[:id])
    @salon.update_attributes(salon_params)
    if params[:salon][:image] != nil
      @salon.image = params[:salon][:image]
    end
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
