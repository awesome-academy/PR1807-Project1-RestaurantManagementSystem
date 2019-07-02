class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order(created_at: :desc).paginate page: params[:page]
  end

  def show
    @reservation = Reservation.find params[:id]
  end

  def new
    @reservation = Reservation.new
    @reservation.reserved_dishes.build
  end

  def create
    @reservation = current_user.reservations.build reservation_params
    if @reservation.save
      flash[:success] = t "message.create_success"
      redirect_to @reservation
    else
      flash[:danger] = t "message.failure"
      render "new"
    end
  end

  def edit
    @reservation = Reservation.find params[:id]
  end

  def update
    @reservation = Reservation.find params[:id]
    if @reservation.update_attributes reservation_params
      flash[:success] = t "message.update_success"
      redirect_to @reservation
    else
      flash[:danger] = t "message.failure"
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find params[:id]
    @reservation.destroy
    redirect_to reservations_url
  end

  private
  def reservation_params
    date_time = DateTime.parse params[:reservation][:date_time]
    params.require(:reservation).permit(:numbers_people,
      reserved_dishes_attributes: [:dish_id, :quantity, :id, :_destroy]).
      merge date_time: date_time
  end
end
