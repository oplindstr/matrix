class BoardMembersController < ApplicationController
	before_action :set_year, only: [:index, :new]

   def index
   	  @min_year = [BoardMember.minimum(:year), PositionMember.minimum(:year)].min

      @board_members = User.joins(:board_members).where("board_members.year = ? AND supplementary = ?", @year, false)
      @supplementary_members = User.joins(:board_members).where('board_members.year = ? AND supplementary = ?', @year, true)
      @position_members = User.joins(:position_members).where('position_members.year = ?', @year)

      @board_members = @board_members.sort_by { |f| f.priority_in_board_member_list(@year) }
      @supplementary_members = @supplementary_members.sort_by { |f| f.priority_in_board_member_list(@year) }

      @all = (@board_members | @supplementary_members) | @position_members

      @all = @all.sort_by! { |f| f.priority_in_board_member_list(@year) }

      @position_members = (@all - @board_members) - @supplementary_members

      @years = BoardMember.order(year: :desc).uniq.pluck(:year) | PositionMember.order(year: :desc).uniq.pluck(:year)

      @this_year = DateHelper.year
   end

   def new
      @board_member = BoardMember.new
      @users = User.all
      @years = (1995..@year+1).to_a
   end

   def create
      @board_member = BoardMember.new(board_member_params)
      
      if @board_member.save
         redirect_to '/hallitus', notice: "The board member has been uploaded."
      else
         render "new"
      end
   end

   def board_members_and_positions
     @board_members = BoardMember.all.order(year: :desc)
     @position_members = PositionMember.all.order(year: :desc)
   end

   def destroy
      @member = BoardMember.find(params[:id])
      @member.destroy
      redirect_to '/board_members_and_positions', notice:  "The record has been deleted."
   end
   
   private

    def set_year
      if params[:year]
        if params[:year].to_i == 0
          @year = DateHelper.year
        else
          @year = params[:year].to_i
        end
      elsif params[:vuosi]
        if params[:vuosi].to_i == 0
          @year = DateHelper.year
        else
          @year =  params[:vuosi].to_i
        end
      else
      	@year = DateHelper.year
      end
    end

    def board_member_params
      params.require(:board_member).permit(:user_id, :year, :supplementary, :name, :avatar)
    end
    
end