class TeamsController < ApplicationController
  #before_action :logged_in_user, only: [:add, :create, :edit, :update]
  #before_action :correct_user, only: [:edit, :update]

  #Method for use in development
  def first
    @team = Team.find(Team.first)
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    #debugger
  end

  def add
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      #Should consider some alteration of the message.
      flash[:success] = "New team created."
      redirect_to @team
    else
      render 'add'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Team profile updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def viewteams
    #Should consider to use show as an entry point instead
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_contact_name, :team_phone_nr, :user_id)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
