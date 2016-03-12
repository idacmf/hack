class NotificationsController < ApplicationController

  def index
    if !user_signed_in?
      flash[:alert] = "You need to be signed in to view your notifications."
      redirect_back
    end

    @notifications = UserNotification.all
  end

  def new

  end
end
