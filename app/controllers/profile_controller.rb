class ProfileController < ApplicationController
  def show
    @signed_in_user = current_user
    @user_profile = User.find(params[:id])
  end
end
