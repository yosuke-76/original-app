class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def new
    @Schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end



  private
  def schedule_params
    params.permit(:title, :content, :start_time, :end_time).merge(user_id: current_user.id)
  end
end
