class BoardMembersController < ApplicationController
	before_action :set_year, only: [:index, :new, :create]

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

      @years.sort_by! { |y| -y }

      @this_year = DateHelper.year
   end

   def new
      @board_member = BoardMember.new
      @users = User.all
   end

   def create
      @board_member = BoardMember.new(board_member_params)
      
      respond_to do |format|
        if @board_member.save
          format.html { redirect_to '/hallitus?vuosi=' + @board_member.year.to_s, notice: "The board member has been uploaded." }
        else
          @users = User.all
          @user = @board_member.user_id
          format.html { render :new, status: :unprocessable_entity, location: new_board_member_path }
        end
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