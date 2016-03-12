class UsersController < ApplicationController

  def edit_account
    if user_signed_in?
      @user = current_user
    else
      flash[:alert] = "You must be signed in!"
      redirect_to new_user_session_path
    end
  end



end
