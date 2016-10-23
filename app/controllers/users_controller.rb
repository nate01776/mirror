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

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :phone, :password)
  end
end
