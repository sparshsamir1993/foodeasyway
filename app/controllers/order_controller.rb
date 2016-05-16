class OrderController < ApplicationController
	before_action :authenticate_user!
	
	def create
		user_id = current_user.id
		restaurant_id = params[:restaurant_id]
		id = params[:id]
		@restaurant = Restaurant.find(restaurant_id)
		@restaurant.users.new
		@item = @restaurant.items.find(id)
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

	def trigger_sms_alerts(e)
	    @alert_message = "
	      [This is a test] ALERT! 
	      It appears the server is having issues. 
	      Exception: #{e}. 
	      Go to: http://newrelic.com for more details."
	    @image_url = "http://howtodocs.s3.amazonaws.com/new-relic-monitor.png"

	    @admin_list = YAML.load_file('config/administrators.yml')

	    begin
	      @admin_list.each do |admin|
	        phone_number = admin['phone_number']
	        send_message(phone_number, @alert_message, @image_url)
	    end
	      
	      flash[:success] = "Exception: #{e}. Administrators will be notified."
	    rescue
	      flash[:alert] = "Something when wrong."
	    end


	    redirect_to '/'
	 end


  def server_error
    raise 'A test exception'
  end

  private

    def send_message(phone_number, alert_message, image_url)

      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      
      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message,
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
      puts message.to
    end


end
