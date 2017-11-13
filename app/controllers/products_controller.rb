class ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_manager!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  expose :products, ->{ Product.all }
  expose :product

  # GET /products
  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    product = current_manager.products.new(product_params)
    if product.save
      redirect_to product_path(product), notice: 'The product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'The product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
      redirect_to products_url, notice: 'The product was successfully erased.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :amount)
    end
end
