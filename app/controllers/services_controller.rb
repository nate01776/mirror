class ServicesController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @service = @salon.services.find(params[:id])
  end
end
