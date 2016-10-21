class ProductsController < ApplicationController
  def show
    @salon = Salon.find(params[:salon_id])
    @product = @salon.products.find(params[:id])
  end

  def new
    @salon = Salon.find(params[:salon_id])
    @product = Product.new
    @service_types = Product::SERVICE_TYPES
  end

  def create
    @salon = Salon.find(params[:salon_id])
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

  private

  def product_params
    params.require(:product).permit(:name, :description, :service_type, :price, :in_stock)
  end
end
