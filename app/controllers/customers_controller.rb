class CustomersController < ApplicationController


  #before_action checks if the user is signed in first
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :update
  #load_and_authorize_resource checks if the signed in user has premission for specific actions
  load_and_authorize_resource except: [:create]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # GET index method calls the index.html.erb form/action under views/customers

  def index
      @customers = Customer.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
      @purchases = Purchase.paginate(page: params[:page],:per_page => 10).order("created_at DESC")
  end

  def show
    @customers = Customer.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @customer = Customer.find(params[:id])
    @purchases = Purchase.paginate(page: params[:page],:per_page => 10).order("created_at DESC")

  end

  def new
    @customer = Customer.new
  end

  def create
    @customers = Customer.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @customer = Customer.create(customer_params)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customers = Customer.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
  end

  def delete
    @customer = Customer.find(params[:customer_id])
  end

  def destroy
    @customers = Customer.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @customer = Customer.find(params[:id])
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:customer_name, :username, :registration_date, :email, :phone_number, :address, :gender)
  end
end
