class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]
    belongs_to :restaurant, foreign_key: 'restaurant_id'
    has_many :orders
    
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
  		  email = auth.info.email if email_is_verified
  		  user = User.where(:email => email).first if email
	      user.password = Devise.friendly_token[0,20]
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      

    	end
  	end
end
