class UsersController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token
	
	def show

	end

	def edit
	end

	def update_contact
		current_user.update(contact: params[:contact], address: params[:address])

		respond_to do |format|
	      format.html{ redirect_to order_path(params[:order_id])}
	      format.json { render json: current_user, status: :ok}
	    end
	end

    def destroy
		current_user.destroy
    	redirect_to root_path
    end

    private
    def user_params
    	params.require(:user).permit(:email, :contact, :address, :restaurant_id, :_method, :utf8, :authenticity_token, :commit, :id)
    end
end
