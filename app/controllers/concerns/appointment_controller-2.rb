class AppointmentsController < ApplicationController

  #before_action checks if the user is signed in first
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :update
  #load_and_authorize_resource checks if the signed in user has premission for specific actions
  load_and_authorize_resource except: [:create]
  #skip_authorize_resource skips authorization for these pages, the reason for this is that the technician needs to see these pages aswell so he can finish his tasks
  skip_authorize_resource :only => [:dailyAppointments, :weeklyAppointments, :allAppointments, :pendingAppointments, :finishedAppointments]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    # GET appointments index method calls the index.html.erb form/action under views/appointments
  def index
    @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET all appointments method calls the allAppointments.html.erb form/action under views/appointments and order them from the newest one
  def allAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET daily appointments method calls the dailyAppointments.html.erb form/action under views/appointments and order them from the newest one
  def dailyAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET weekly appointments method calls the weeklyAppointments.html.erb form/action under views/appointments and order them from the newest one
  def weeklyAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET finished appointments method calls the finishedAppointments.html.erb form/action under views/appointments and order them from the newest one
  def finishedAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET pending appointments method calls the pendingAppointments.html.erb form/action under views/appointments and order them from the newest one
  def pendingAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def appointmentsForTomorrow
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  def show
  @appointment = Appointment.find(params[:id])
end

def new
  @users = User.all
  @customers = Customer.all
  @appointment = Appointment.new
end

def create
  @appointment = Appointment.new(params[:book])
   @user = current_user
   @appointment = @user.appointments.new(appointment_params)
  @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  @appointment = Appointment.create(appointment_params)

end

def edit
  @appointment = Appointment.find(params[:id])
end

def update
  @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  @appointment = Appointment.find(params[:id])

  @appointment.update_attributes(appointment_params)
end

def delete
  @appointment = Appointment.find(params[:appointment_id])
end

def destroy
  @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  @appointment = Appointment.find(params[:id])
  @appointment.destroy
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:customer_name, :appointment_note, :technician_name, :phone_number, :appointment_type, :address, :product_model, :appointment_date, :status)
    end
end
