class MailersController < ApplicationController
  def create
    ::GifSenderWorker.perform_at(1.minute.from_now, params[:mailers][:email], params[:mailers][:thought])
    # UserNotifierMailer.send_randomness_email(params[:mailers][:email], params[:mailers][:thought]).deliver_now
    flash[:message] = "You did it! Email sent to #{params[:mailers][:email]}"
    redirect_to "/sent"
  end

  def sent
  end
end
