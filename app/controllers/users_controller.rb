class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "message.check_email"
      redirect_to root_url
    else
      render "new"
    end
  rescue Net::OpenTimeout
    @user.destroy
    flash[:danger] = t "message.failure"
    render "new"
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "message.update_success"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "message.deleted_success"
    redirect_back_or users_url
  end

  private
  def user_params
    birth_date = params[:user][:birth_date]&.to_date()
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :phone_number, :gender, :address).merge birth_date: birth_date
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless correct_user? @user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
