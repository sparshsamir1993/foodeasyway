class UserController < ApplicationController  
  def update
  		@user = current_user
  		
  		if @user.update_attributes(user_params)
  			@restaurant = @user.restaurant_id
        		redirect_to user_order_index_path(:user_id=>@user, :restaurant_id=>@restaurant)
     		else
        		
        		render :action => 'edit'
        end
          
  end
  def user_params
      params.require(:user).permit(:contact, :address, :restaurant_id)
  end
end