class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_name, :mobile_number, :role_id])
  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    user_params.permit(:user_name)
  end
end
   #CanCan::AccessDenied exception is raised if the the logged in user tries to access a particular action in a controller that he does’nt have permission to 

    rescue_from CanCan::AccessDenied do 
  	redirect_to root_path, notice: "Unauthorized Access"
    end
end
