class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :destroy]

  def index
    @activities = Activity.all
    @trip_day = TripDay.find(params[:trip_day_id])
    @trip = Trip.find(params[:trip_id])
  end

  def show
  end

  def new
    @activity = Activity.new
    @trip_day = TripDay.find(params[:trip_day_id])
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to trip_trip_day_activity_path(params[:trip_id], params[:trip_day_id], @activity), notice: "Atividade criada com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @activity.destroy
      redirect_to trip_trip_day_activities_path(params[:trip_id], params[:trip_day_id]), notice: "Atividade deletada com sucesso"
    else
      redirect_to trip_trip_day_activities_path(params[:trip_id], params[:trip_day_id]), alert: "Erro ao deletar atividade"
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description).merge(trip_day_id: params[:trip_day_id], purposed_by_id: current_user.id, status: 0)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
