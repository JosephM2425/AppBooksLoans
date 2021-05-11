class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, notice: 'Access not allowed'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :username, :phoneNumber])
  end
end
