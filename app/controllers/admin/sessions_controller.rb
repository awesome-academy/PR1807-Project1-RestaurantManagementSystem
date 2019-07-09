class Admin::SessionsController < ApplicationController
  def new
    render layout: false
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_users_path
    else
      flash.now[:danger] = t "message.invalid_email_password"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
