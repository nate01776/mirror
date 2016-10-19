class UserController < ApplicationController
  def show
    @user = current_user
    if @user != nil
      @status = @user.user_type
    end
  end
end
