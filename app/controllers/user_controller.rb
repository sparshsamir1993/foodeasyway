class UserController < ApplicationController  
  
  def user_params
      params.require(:user).permit(:contact, :address, :restaurant_id)
  end
end