class BoardMember < ActiveRecord::Base
	belongs_to :user
	
    def avatar
      return self.user.avatar_url
    end
end