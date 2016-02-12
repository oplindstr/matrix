class BoardMembersController < ApplicationController
	before_action :set_year, only: [:index]

   def index
   	  @min_year = BoardMember.minimum(:year)
      @members = BoardMember.where(year: @year)

      @years = BoardMember.order(year: :desc).uniq.pluck(:year)
   end
   
   private

    def set_year
      if params[:year]
        @year = params[:year]
      else
      	@year = DateHelper.year
      end
    end
    
end