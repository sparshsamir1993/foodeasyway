class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token


  def configure_permitted_parameters
   added_attrs = [:contact, :address]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 end
 def require_admin
    unless current_user.admin
        redirect_to root_path
    end
end

end
