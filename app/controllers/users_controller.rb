class UsersController < ApplicationController
  def show
    @user = current_user
    @image = @user.image
    if @user != nil
      @status = @user.user_type
    end
    if @status == "owner"
      @owned_salons = []
      Salon.all.each do |salon|
        if salon.owner == @user
          @owned_salons << salon
        end
      end
    end
    if @status == 'stylist'
      @stylist_services = Stylistservice.where("user_id = #{@user.id}")
      @client_appts = []
      Clientservice.all.each do |appt|
        if appt.stylist.id == @user.id
          @client_appts << appt
        end
      end
      @client_appts = @client_appts.sort_by{ |appt| appt.datetime }
    end
  end

  def edit
    @user = current_user
    @image = @user.image
  end

  def update
    @user = current_user
    if params[:user].nil?
      redirect_to root_path
    else
      @user.image = params[:user][:image]
      if @user.save
        redirect_to root_path
        flash[:notice] = "Salon added successfully"
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :phone, :password)
  end
end
