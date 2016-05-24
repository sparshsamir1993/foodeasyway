class VisitorsController < ApplicationController
	
  def index
  	@user = current_user
	  	
  end
  def update
  		@user = current_user
  		
  		if @user.update_attributes(user_params)
  			@restaurant = @user.restaurant_id
        		redirect_to user_order_index_path(:user_id=>@user, :restaurant_id=>@restaurant)
     		else
        		
        		render :action => 'edit'
        end
          
    end
    def destroy
		current_user.destroy
    	redirect_to root_path
    end
end
