class UserController < ApplicationController
  def show
    @user = current_user
    @status = @user.status
  end
end
