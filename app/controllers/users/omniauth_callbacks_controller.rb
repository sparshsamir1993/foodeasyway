class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def update
    @user = current_user
    
    if @user.update_attributes(user_params)
      @restaurant = @user.restaurant_id
          redirect_to user_order_index_path(:user_id=>@user, :restaurant_id=>@restaurant)
      else
          @subjects = User.all
          render :action => 'edit'
        end
        
  end
end