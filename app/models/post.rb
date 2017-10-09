class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_comments
	has_many :post_tags

	validates :title, presence: true, length: { maximum: 500 }
	validates :text, presence: true, length: { maximum: 25000 }

	def timestamp
	  time = self.created_at
      return DateHelper.weekday(time) + ' ' + time.strftime("%d") + '. ' + DateHelper.month_name(time) + 'ta ' + time.strftime("%Y") 
	end

	def comment_count
      return self.post_comments.size
	end

	def comment_count_text
      if self.comment_count == 1
      	return '1 kommentti'
      else
      	return self.comment_count.to_s + ' kommenttia'
      end
    end
end
