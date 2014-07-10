class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            #image:auth.info.image,
			    #location:auth.info.location,
                            #gender:auth.extra.raw_info.gender
			    #age:auth.extra.user_hash.birthday
                               #require 'fb_graph'
                            #friends = FbGraph::User.me(USER-FB-ACCESS-Token).friends
                            	#require 'koala'
			    # @graph = Koala::Facebook::API.new(oauth_access_token)
                            #friends = @graph.get_connections("me", "friends")
                            password:Devise.friendly_token[0,20],
                          )
      end   end
  end

end
