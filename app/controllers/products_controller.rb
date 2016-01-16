class ProductsController < ApplicationController

  #before_action checks if the user is signed in first
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token, :only => :update
  load_and_authorize_resource except: [:create]
  #load_and_authorize_resource checks if the signed in user has premission for specific actions
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
      @products = Product.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def show
   @product = Product.find(params[:id])
  end

  def new
   @product = Product.new
  end

  def create
    @products = Product.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @product = Product.create(product_params)
    if @product.save
      redirect_to :action => :index
    else
      render 'new'
    end

  end

  def edit
   @product = Product.find(params[:id])
  end

  def update
   @products = Product.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
   @product = Product.find(params[:id])
   if @product.update_attributes(product_params)
       redirect_to :action => :index
     else
       render 'edit'
     end
  end

  def delete
   @product = Product.find(params[:product_id])
  end

  def destroy
   @products = Product.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
   @product = Product.find(params[:id])
   @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :description, :product_model, :serial_number, :price, :stock, :asset)
    end
end
