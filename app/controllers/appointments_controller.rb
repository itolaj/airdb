class AppointmentsController < ApplicationController

  #before_action checks if the user is signed in first
  before_action :authenticate_user!
  #load_and_authorize_resource checks if the signed in user has premission for specific actions
  load_and_authorize_resource except: [:create]
  #skip_authorize_resource skips authorization for these pages, the reason for this is that the technician needs to see these pages aswell so he can finish his tasks
  skip_authorize_resource :only => [:dailyAppointments, :weeklyAppointments, :allAppointments, :pendingAppointments, :finishedAppointments]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    # GET appointments index method calls the index.html.erb form/action under views/appointments
  def index
    @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  # GET appointmens method show calls the show.html.erb form to show the appointment
  def show
  end

  #GET all appointments method calls the allAppointments.html.erb form/action under views/appointments and order them from the newest one
  def allAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET daily appointments method calls the dailyAppointments.html.erb form/action under views/appointments and order them from the newest one
  def dailyAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search])
  end

  #GET weekly appointments method calls the weeklyAppointments.html.erb form/action under views/appointments and order them from the newest one
  def weeklyAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search])
  end

  #GET finished appointments method calls the finishedAppointments.html.erb form/action under views/appointments and order them from the newest one
  def finishedAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  #GET pending appointments method calls the pendingAppointments.html.erb form/action under views/appointments and order them from the newest one
  def pendingAppointments
       @appointments = Appointment.paginate(page: params[:page],:per_page => 10).search(params[:search]).order("created_at DESC")
  end

  # GET appointments/new action calls the new.html.erb form under views/appointments
  def new
    @users = User.all
    @customers = Customer.all
    @appointment = Appointment.new

  end

  #GET appointemnt/id/edit calls the edit.html.erb form to edit the appointment
  def edit
  end

  # POST method which allowes us to create a new appointment
  def create
    #In our case when we create a new appointment we assign the appointment to the current user and it will be saved uder his/her name
    @user = current_user
    @appointment = @user.appointments.new(appointment_params)
      respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT method to update the appointment
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @appointment = Appointment.find(params[:appointment_id])
  end

  # DELETE method for the appointment, to delete the appointment
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
