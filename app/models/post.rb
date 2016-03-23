class Post < ActiveRecord::Base
	belongs_to :user

	def timestamp
	  time = self.created_at
      return DateHelper.weekday(time) + ' ' + time.strftime("%d") + '. ' + DateHelper.month_name(time) + 'ta ' + time.strftime("%Y") 
	end
end
