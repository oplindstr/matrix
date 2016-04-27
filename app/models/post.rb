class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_comments
	has_many :post_tags

	def timestamp
	  time = self.created_at
      return DateHelper.weekday(time) + ' ' + time.strftime("%d") + '. ' + DateHelper.month_name(time) + 'ta ' + time.strftime("%Y") 
	end

	def comment_count
      return self.post_comments.size
	end
end
