class UsersController < ApplicationController
  def show
    @user = current_user
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
  end

  def edit
    @user = current_user
    @image = @user.image
  end

  def update
    @user = current_user
    @user.image = params[:user][:image]
    @user.save!
    # @uploader.store!(params[:image])
    # @image = @user.store!(image_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :phone, :password)
  end
end
