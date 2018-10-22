class SchedulesController < ApplicationController
  skip_before_action :authenticate_user!, :only => :handle_inbound
  skip_before_action :verify_authenticity_token

  def index
    @schedules = current_user.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    if current_user.schedules.map{|p|p.from_time}.include?(params[:schedule][:from_time]) && current_user.schedules.map{|sch|sch.date.to_s}.include?(params[:schedule][:date])
      flash.now[:notice] = 'You have selected this time!'
      redirect_to root_path
    else
      @user = User.find(current_user.id)
      @user_schedule = @user.schedules.new(schedule_params)
      if @user_schedule.save
        redirect_to schedules_path
      else
        redirect_to root_path
      end
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes(schedule_params)
    @schedule.save
    redirect_to schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.delete
    redirect_to root_path
  end


  # Defines our handler for the "inbound" event type.
  # This gets called for every inbound event sent from Mandrill.
  def handle_inbound
    Rails.logger.info("============== Handle Inbound ======================")
    user = User.find(8)
    UserMailer.with(user: user).ceo_list.deliver
  end

  private
  def schedule_params
    params.require(:schedule).permit(:date, :city, :state, :from_time, :end_time)
  end
end
