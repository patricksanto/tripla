class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path, alert: "You need to sign in first"
      return
    end

    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.owned_by = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :date, :duration, :place)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
