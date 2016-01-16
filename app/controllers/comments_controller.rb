class CommentsController < ApplicationController

  #create action it allowes us to creat a comment for the appointment when a technician/user wants to leave a note for appointments, either for pending/done/no status appointments
  def create
    #Defining in which appointment we are creating a commenet/note
    @appointment = Appointment.find(params[:appointment_id])
    @comment = @appointment.comments.create(comments_params)
    #calling the comment_created method int comment_mailer.rb under mailers ro create the comment and make it ready to mail it
    CommentMailer.comment_created(current_user,@appointment.user,@comment.content, @comment.status, @appointment, @appointment.customer_name, @appointment.technician_name, @appointment.appointment_date, @appointment.phone_number, @appointment.address, @appointment.appointment_type).deliver
    redirect_to appointment_path(@appointment)
  end

  private

  def comments_params
    params.require(:comment).permit(:status, :content)
  end

end
