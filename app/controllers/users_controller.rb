class UsersController < ApplicationController

  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :update
  load_and_authorize_resource except: [:create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

# GET index method calls the index.html.erb form/action under views/users
  def index
      @users = User.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @users = User.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @user = User.create(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @user = User.find(params[:id])

    @user.update_attributes(user_params)
  end

  def delete
    @user = User.find(params[:user_id])
  end

  def destroy
    @users = User.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
    @user = User.find(params[:id])
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :registration_date, :expiration_date, :personal_number, :phone_number, :email, :password, :password_confirmation, :address, :user_role)
    end
end
