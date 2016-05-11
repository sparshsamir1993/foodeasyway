class OrderController < ApplicationController
	def add
		@restaurant_id = params[:restaurant_id]
		id = params[:id]
			if  session[:order] then
				order = session[:order]
			else
				session[:order] = {}
				order = session[:order]
			end

			if  order[id] then
				order[id] = order[id] + 1
			else
				order[id] = 1
			end
		redirect_to :action => :index, :restaurant_id =>@restaurant_id
	end

	def clear
		@restaurant_id = params[:restaurant_id]
		session[:order] = nil
		redirect_to :action => :index, :restaurant_id =>@restaurant_id
	end

	def index
		@restaurant_id = params[:restaurant_id]
		if @restaurant_id.present?
			@restaurant = Restaurant.find(params[:restaurant_id])
			@restaurant1 = Restaurant.find(params[:restaurant_id])
		end
		if  session[:order] then
			@order = session[:order]
		else
			@order = {}
		end
	end
	def show
	end
end
