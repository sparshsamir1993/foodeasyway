class Api::V1::UsersController < Api::V1::BaseController
    protect_from_forgery with: :null_session
    skip_before_filter :verify_authenticity_token
    require 'koala'
    include DeviseTokenAuth::Concerns::SetUserByToken

    def index
       users = User.all

       render(
         json: ActiveModel::ArraySerializer.new(
           users,
           each_serializer: Api::V1::UserSerializer,
           root: 'users',
         )
       )
     end
    def show
      @user = User.find(params[:id])
      render(json: Api::V1::UserSerializer.new(@user).to_json)
    end

    def authenticatFacebookToken
      @graph = Koala::Facebook::API.new(params[:'access-token'])
      profile = @graph.get_object('me', fields:'email,first_name,last_name')
      @user = User.find_or_create_by(email: profile['email'])
      if @user.update('access-token': params[:'access-token'])
        puts "------------"
        
        if !current_user          
          @current_user = @user
          current_user = @user
        end
        puts "-----signed inn-------"
        @client_id = SecureRandom.urlsafe_base64(nil, false)
        @token     = Devise.friendly_token
        @user.tokens[@client_id] = {
          token: BCrypt::Password.create(@token),
          expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
        } 
        auth_header = @user.build_auth_header(@token, @client_id)
        # update the response header
        response.headers.merge!(auth_header)
        # resource = warden.authenticate!(auth_header)
        warden.set_user(@user, scope: :user)
        sign_in(@user)

        render(json: Api::V1::UserSerializer.new(@user).to_json)
      
        # sign_in_and_redirect (@user)
        # session[:user_id] = @user.id
        # current_user = @user
        
        # redirect_to api_v1_user_session_path(:email=>@user.email, :password=>Devise.friendly_token[0,20]), :method=>:post
        # render(json: Api::V1::UserSerializer.new(@user).to_json)
      end
      # if @user.present?
        
      #   render(json: Api::V1::UserSerializer.new(@user).to_json)
      #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      # end
      
    end

    def order_history
      id = params[:id]
      @user=User.find(params[:id])
      @orders = @user.orders
      if @orders
        render json: @orders,
            each_serializer: Api::V1::OrderSerializer
      end
    end
end
