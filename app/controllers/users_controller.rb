class UsersController < ApplicationController
  def show
    @user = current_user
    if @user != nil
      @status = @user.user_type
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :phone, :password)
  end
end
