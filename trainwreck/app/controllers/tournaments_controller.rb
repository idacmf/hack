class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def index_my_tournaments
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    # Store the user id of user creating the tournament in table
    @tournament.user_id = current_user.id

    #fix data before save
    #its time_start(1i)=>"2016", time_start(2i)=>"03" etc, want only 2016-03...
    #change time_start/end to datetime or string?
    @unix = @tournament.time_start.to_datetime

    if @tournament.save
      redirect_to @tournament
    else
      render 'new'
    end
  end

  def search
    if params[:search]
      @tournament = Tournament.search(params[:search]).order("created_at DESC")
    else
      @tournament = Tournament.order("created_at DESC")
    end
    if !@tournament.present?
      flash[:alert] = "Tournament does not exist"
      redirect_to :back
    end
  end

  private
  def tournament_params
    params.require(:tournaments).permit(:name, :status, :location, :time_start, :time_end, :max_teams)
  end

end

