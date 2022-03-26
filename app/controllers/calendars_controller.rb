class CalendarsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @events = Event.where(user: current_user)
  end
end
