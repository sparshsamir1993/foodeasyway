class Api::V1::UsersController < Api::V1::BaseController
    
    skip_before_filter :verify_authenticity_token
    require 'koala'

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
      @graph = Koala::Facebook::API.new(params[:access_token])
      profile = @graph.get_object('me', fields:'email,first_name,last_name')
      @user = User.find_or_create_by(email: profile['email'])
      @user = @user.update(access_token: params[:access_token])
      render(json: Api::V1::UserSerializer.new(@user).to_json)
    end
end
