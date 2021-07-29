class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update]

  def index
    @schedule = current_user.schedules
    @schedules = Schedule.all 
    @p = Schedule.ransack(params[:q])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path
    else
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to root_path
  end

  def search
    @p = Schedule.ransack(params[:q])
    
    @search_schedules = @p.result.includes(:schedule)
  end


  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time, :end_time).merge(user_id: current_user.id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
