class ActivityController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
  end

  def types
    @val = params[:val]
  end

  def travelling_companions
  end

  def result
    @value = params[:val]
  end

  def summary

  end
end
