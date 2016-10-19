class UserController < ApplicationController
  def show
    @user = current_user
    @status = @user.user_type
  end
end
