class AirdbController < ApplicationController

  #Home action method with conditions which will allow the user to sign in and redirect_to the assigned path
  def home
      if user_signed_in?
          path = case current_user.user_role
          when 'Director'
            products_path
          when 'Technician'
            dailyAppointments_path
          when 'Secretary'
            appointments_path

          else
            users_path
          end
            redirect_to path
          else
            redirect_to new_user_session_path
        end
      end


end
