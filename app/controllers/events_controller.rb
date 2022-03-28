class EventsController < ApplicationController
  before_action :sign_in_required, only: [:index, :new, :create, :destroy]

  def index
    @events = Event.where(user: current_user).order(year: :desc).order(month: :desc).order(day: :desc)
  end

  def new
    @event = Event.new
    @companies = Company.where(user: current_user)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: '作成に成功'
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy!
      redirect_to events_path, notice: '削除に成功'
    else
      redirect_to events_path, notice: '削除に失敗'
    end
  end

  private

  def event_params
    @params = params.require(:event).permit(:title, :year, :month, :day, :url, :company_id)
    @params[:user_id] = current_user.id
    @params
  end
end
