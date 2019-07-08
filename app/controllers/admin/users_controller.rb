class Admin::UsersController < ApplicationController
  layout "admin"
  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id] || User.new
  end

  def update
    @user = User.find params[:id]
    if @user
      if @user.update_attributes user_params
        flash[:success] = t "message.update_success"
        redirect_to admin_user_path(@user.id)
      else
        render "edit"
      end
    else
      @user = User.new user_params
      if @user.save
        @user.send_activation_email
        flash[:info] = t "message.check_email"
        redirect_to admin_user_path(@user.id)
      else
        render "edit"
      end
    end
  rescue Net::OpenTimeout
    @user.destroy
    flash[:danger] = t "message.failure"
    render "edit"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "message.deleted_success"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone_number, :gender, :address, :birth_date
  end
end
