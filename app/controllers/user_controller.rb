class UserController < ApplicationController
  def show
    @user = current_user
    if @user.is_owner
      @status = "owner"
    elsif @user.is_stylist
      @status = "stylist"
    else
      @status = "client"
    end
  end
end
