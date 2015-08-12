class TripsController < ApplicationController
  def show
    @extras = Extra.all
    @trip = Trip.find(params[:id].to_i)
  end

  def index
    @trips = Trip.all
    @hash = Gmaps4rails.build_markers(@trips) do |trip, marker|
      # binding.pry
      marker.lat trip.lat
      marker.lng trip.long
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :trip_cost,
                                 :destination_id, :activity_id, :image, :lat, :long)
  end

end
