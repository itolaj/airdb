class CommentMailer < ActionMailer::Base

  #The coment_create metho which allowes us to send the email with the content of the comment, status and current appointment details
  def comment_created(current_user,appointment_user,content, status, appointment, customer_name, technician_name, appointment_date, phone_number, address, appointment_type)

    @current_user = current_user
    @appointment_user = appointment_user
    @content = content
    @status = status
    @appointment = appointment
    @appointment.customer_name = customer_name
    @appointment.appointment_date = appointment_date
    @appointment.technician_name = technician_name
    @appointment.phone_number = phone_number
    @appointment.address = address
    @appointment.appointment_type = appointment_type

  mail(to: appointment_user.email,
         from: "airdbapp@gmail.com", #using Gmail smtp settings it will override this "from:" so it doesnt matter what we put here
         subject: "Note Created",
    )

  end

end
