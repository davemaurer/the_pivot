class ReservationsController < ApplicationController

  def create
    if current_user
      reservation = current_user.reservations.create
      session[:cart].each do |trip_id, quantity|
        #need to revise; no order trip
        #OrderTrip.create(trip_id: trip_id, reservation_id: reservation.id, quantity: quantity)
      end
      session[:cart] = {}
      flash[:notice] = "Order was successfully placed!"
      redirect_to reservations_path
    else
      flash[:notice] = "You must be logged in to checkout!"
      redirect_to login_path
    end
  end

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
