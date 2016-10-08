class OrdersController < ApplicationController
	before_action :authenticate_user!
	skip_before_filter :verify_authenticity_token
	# def create
	# 	user_id = current_user.id
	# 	restaurant_id = params[:restaurant_id]
	# 	id = params[:id]
	# 	@restaurant = Restaurant.find(user_id)
	# 	@restaurant.users.new
	# 	#@item = @restaurant.items.find(id)
	# 	@order = @restaurant.orders.new
	# 	@order.restaurant_id = @restaurant.id
	#
	# 	@order.user_id = current_user.id
	#
	#
	# 	if session[:order] then
	# 			bill = session[:order]
	#
	# 	else
	# 		session[:order] = @order.order
	# 		bill = session[:order]
	# 	end
	#
	# 	if bill[id] then
	# 		bill[id] = bill[id] + 1
	# 	else
	# 		bill[id] = 1
	# 	end
	# 	@order.order = bill
	# 	@order.save
	# 	redirect_to :action => :index, :restaurant_id =>restaurant_id
	#
	# end
	def create
		@order = Order.new(order_params)
		@order.restaurant_id = params[:restaurant_id]
		@order.user_id = current_user.id
		byebug
		respond_to do |format|
	      if @order.save
	        format.html { redirect_to @order, notice: 'Cart was successfully created.' }
	        format.json { render :show, status: :created, location: @order }
	      else
	        format.html { render :new }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end

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
		@order_grouped = @order.order_items.group_by(&:restaurant_id)


	end

	def show
		@order = Order.find(params[:id])
		@order_grouped = @order.order_items.group_by(&:restaurant_id)
	end


    def send_message
    @restaurant_id = params[:restaurant_id]
	  @restaurant = Restaurant.find(@restaurant_id)
      @phone_numbers = ["+91#{@restaurant.contact}","+919176028509"]
      @twilio_number = '+14782027248'
      @client = Twilio::REST::Client.new('AC5dee8c153517e73b44172c169fbac183', 'f941bca314a94fab093b1290a91757a8')

      @user = current_user
	  @order = @restaurant.orders.all
	  @text_order = ""
	  @bill_S=""
	  @prices =Array.new
	  sum = 0
	  if @order.last.present?
		@order.last.order.each do |id,quantity|
		  if @restaurant.items.find_by_id(id).present?
			@item = @restaurant.items.find_by_id(id).name
			@price =  @restaurant.items.find_by_id(id).price * quantity
			@text_order.concat(" #{@item} #{quantity}")
			@prices.push(@price)
		  end
		end
	  end
	  @prices.each do |p|
	  	sum+=p
	  end
	  @phone_numbers.each do |p|
	      message = @client.account.messages.create(
	        :from => @twilio_number,
	        :to => p,
	        :body => "#{@text_order} ordered by #{@user.name} Phone => #{@user.contact} Address => #{@user.address} Total is #{sum}"
	        # US phone numbers can make use of an image as well.
	        # :media_url => image_url
	      )
      end

    end

	private

		def order_params
			params.require(:order).permit(:restaurant_id, :user_id)
		end


end
