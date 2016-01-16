class PurchasesController < ApplicationController

  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :update
  load_and_authorize_resource except: [:create]
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
      @purchases = Purchase.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def reminders
      @purchases = Purchase.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def show
   @purchase = Purchase.find(params[:id])
 end

 def new
   @purchase = Purchase.new
 end

 def create
   @purchases = Purchase.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
   @purchase = Purchase.create(purchase_params)
 end

 def edit
   @purchase = Purchase.find(params[:id])
 end

 def update
   @purchases = Purchase.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
   @purchase = Purchase.find(params[:id])

   @purchase.update_attributes(purchase_params)
 end

 def delete
   @purchase = Purchase.find(params[:purchase_id])
 end

 def destroy
   @purchases = Purchase.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
   @purchase = Purchase.find(params[:id])
   @purchase.destroy
 end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:customer_name, :product_name, :product_model, :price, :purchase_date, :maintnance_date)
    end
end
