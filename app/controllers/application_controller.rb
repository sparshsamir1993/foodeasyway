class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, if: :verify_api
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

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end
# def sign_in_and_redirect(resource_or_scope, resource=nil)
#   scope      = Devise::Mapping.find_scope!(resource_or_scope)
#   resource ||= resource_or_scope
#   sign_in(scope, resource) unless warden.user(scope) == resource
#   # redirect_to stored_location_for(scope) || after_sign_in_path_for(resource)
#   render :json => resource_or_scope.to_json
# end

def after_sign_in_path_for(resource)
  
    if params[:controller] == "api/v1/users"
      respond_to :json
        # render json: Api::V1::UserSerializer.new(@user).to_json 
    elsif resource.class == User
      root_path 
    end
  end

end
