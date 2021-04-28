class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path)
      #format.js
    else 
      redirect_to profile_path, notice: "values already exists"
    end
  end

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :username, :phoneNumber, :avatar, :theme)
  end

end
