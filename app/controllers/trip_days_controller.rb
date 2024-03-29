class TripDaysController < ApplicationController
  before_action :set_trip_day, only: [:show]

  def index
  end

  def show
  end

  private

  def set_trip_day
    @trip_day = TripDay.find(params[:id])
  end
end
