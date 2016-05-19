class OrderController < ApplicationController
	before_action :authenticate_user!
	
	def create
		user_id = current_user.id
		restaurant_id = params[:restaurant_id]
		id = params[:id]
		@restaurant = Restaurant.find(restaurant_id)
		@restaurant.users.new
		#@item = @restaurant.items.find(id)
		@order = @restaurant.orders.new
		@order.restaurant_id = @restaurant.id
		
		@order.user_id = current_user.id


		if session[:order] then
				bill = session[:order]
				
		else
			session[:order] = @order.order
			bill = session[:order]
		end

		if bill[id] then
			bill[id] = bill[id] + 1
		else
			bill[id] = 1
		end
		@order.order = bill
		@order.save
		redirect_to :action => :index, :restaurant_id =>restaurant_id
		
	end


	def clear
		@restaurant_id = params[:restaurant_id]
		session[:order] = nil
		Restaurant.find(@restaurant_id).orders.destroy_all
		

		redirect_to :action => :index, :restaurant_id =>@restaurant_id
	end

	def index
		@restaurant_id = params[:restaurant_id]
		@restaurant = Restaurant.find(@restaurant_id)

		@user = current_user
		@order = @restaurant.orders.all
		
	end
	
	def show
	end

	
    def send_message
      @phone_number = "+919789861158"
      @twilio_number = '+19253923612'
      @client = Twilio::REST::Client.new('ACc843e4924e89be0975444841e3803bc2', '121f13ae363f8942c0db202284b9df2a')
      @restaurant_id = params[:restaurant_id]
	  @restaurant = Restaurant.find(@restaurant_id)
      @user = current_user
	  @order = @restaurant.orders.all
	  @text_order = ""
	  if @order.last.present?
		@order.last.order.each do |id,quantity|
		  if @restaurant.items.find_by_id(id).present?
			@item = @restaurant.items.find_by_id(id).name
			@text_order.concat(" #{@item}") 		  
		  end
		end  	
	  end					

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => @phone_number,
        :body => "#{@text_order} ordered by #{@user.name}"
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
      
    end


end
