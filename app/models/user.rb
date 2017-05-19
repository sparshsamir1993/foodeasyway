class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    before_create :generate_authentication_token, :ensure_uid

    include DeviseTokenAuth::Concerns::User
	devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]
    has_many :orders
	has_many :restaurant_owners

	def generate_authentication_token
	 loop do
	   self.authentication_token = SecureRandom.base64(64)
	   break unless User.find_by(authentication_token: authentication_token)
	 end
    end
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.email = auth.info.email
	      user.password = Devise.friendly_token[0,20]
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

    	end
  	end
    def ensure_uid
        if self.uid.blank?
        self.uid = self.email
      end
end
