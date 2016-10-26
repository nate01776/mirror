class ProductsController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @product = @salon.products.find(params[:id])
  end

  def new
    @salon = Salon.find(params[:salon_id])
    @user = current_user
    if @user.id != @salon.owner_id
      redirect_to root_path
    end
    @product = Product.new
    @service_types = Product::SERVICE_TYPES
  end

  def create
    @salon = Salon.find(params[:salon_id])
    @user = current_user
    if @user.id != @salon.owner_id
      redirect_to root_path
    end
    @product = Product.new(product_params)
    if @product.in_stock == "1"
      @product.instock = true
    end
    @product.salon = @salon
    if @product.save
      redirect_to salon_path(@salon.id)
      flash[:notice] = "Product added successfully"
    else
      flash[:notice] = @product.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @user = current_user
    @salon = Salon.find(params[:salon_id])
    @product = Product.find(params[:id])
    if @user.user_type != "owner" || @salon.owner_id != @user.id
      redirect_to root_path
      flash[:notice] = "You do not have authorization to perform this action!"
    end
    @product.destroy
    flash[:notice] = 'Product was successfully deleted'
    redirect_to salon_path(@salon.id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :service_type, :price, :in_stock)
  end
end
