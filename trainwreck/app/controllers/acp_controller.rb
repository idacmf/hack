class AcpController < ApplicationController

  def index
    if !user_signed_in?
      flash[:alert] = "You must be logged in in order to view the admin control panel.";
      redirect_back
    else if !current_user.admin?
      flash[:alert] = "You must be an admin to do this action.";
      redirect_back
         end
      end
  end

  def search
    if params[:search]
      sch = params[:search]
      if sch.length == 0
        flash[:alert] = "You need to search for something."
        redirect_back
      else if sch.length < 4
             if !sch.is_a? Integer
               flash[:alert] = "The search needs to be 4+ character, or a number."
               redirect_back
             end
           end
      end
      @users = User.search(params[:search]).order("created_at DESC");
    else
      @users = User.order("created_at DESC");
    end
    if !@users.present?
      flash[:alert] = "No users were found using this search term.";
      redirect_back
    end
  end

  def edit_user
    @user = User.find(edit_user_params)
  end

  private

  def edit_user_params
    params.require(:id)
  end



end
