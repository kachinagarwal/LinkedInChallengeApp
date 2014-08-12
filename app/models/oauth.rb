class Oauth < ActiveRecord::Base
	def self.from_omniauth(auth)
	    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
		puts  "----------------------------------------------------------------"
		puts auth.inspect
		puts  "----------------------------------------------------------------"
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.image = auth.info.image
		  DateTime.now   tempTime = (DateTime.now) + (60 * 60 * 24)  
		  if(auth.credentials.expires_at)	  
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		  else
		  user.oauth_expires_at = tempTime;
		  end
		   user.save!
	    end
  end
end
