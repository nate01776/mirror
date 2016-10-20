class ServicesController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @service = @salon.services.find(params[:id])
    if @service.type == 'cut'
      @icon = <i class="fa fa-scissors" aria-hidden="true"></i>
    end
  end
end
