class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    byebug
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])


      sign_in @user
      redirect_to user_facebook_omniauth_callback_path
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  end

end
