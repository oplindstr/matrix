class BoardMembersController < ApplicationController
	before_action :set_year, only: [:index, :new]
  before_action :set_uploader, only: [:index, :create]

   def index
   	  @min_year = BoardMember.minimum(:year)
      @members = BoardMember.where(year: @year)

      uploader = AvatarUploader.new
      @avatar = uploader.retrieve_from_store!('public/uploads/avatars/Fuksimerkki.jpg')

      @years = BoardMember.order(year: :desc).uniq.pluck(:year)
   end

   def new
      @board_member = BoardMember.new
      @users = User.all
      @years = (1995..@year+1).to_a
   end

   def create
      @board_member = BoardMember.new(board_member_params)

      uploader = AvatarUploader.new

      uploader.store!(@board_member.avatar)
      
      if @board_member.save
         redirect_to board_members_path, notice: "The board member has been uploaded."
      else
         render "new"
      end
   end
   
   private

    def set_year
      if params[:year]
        @year = params[:year]
      else
      	@year = DateHelper.year
      end
    end

    def set_uploader
      uploader = AvatarUploader.new
    end

    def board_member_params
      params.require(:board_member).permit(:user_id, :year, :avatar)
    end
    
end