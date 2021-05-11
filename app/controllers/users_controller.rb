class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: authenticated_root_path)
    else 
      redirect_to profile_path, notice: "values already exists"
    end
  end

  def change_theme
    if current_user.light?
      current_user.dark!
      @user_ui = { color: 'dark', icon: 'fas fa-sun' }
    else 
      current_user.light!
      @user_ui = { color: 'light', icon: 'fas fa-moon' }
    end

    respond_to do |format|
      format.js
    end
  end

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :username, :phoneNumber, :avatar, :theme)
  end

end
