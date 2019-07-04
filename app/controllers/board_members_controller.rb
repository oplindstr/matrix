class BoardMembersController < ApplicationController
	before_action :set_year, only: [:index, :new, :create]
  before_action :ensure_that_sub_admin, except: [:index]

 def index
    if BoardMember.count > 0 and PositionMember.count > 0
 	    @min_year = [BoardMember.minimum(:year), PositionMember.minimum(:year)].min
    elsif BoardMember.count > 0
      @min_year = BoardMember.minimum(:year)
    elsif PositionMember.count > 0
      @min_year = PositionMember.minimum(:year)
    else
      @min_year = DateHelper.year
    end

    @years = BoardMember.order(year: :desc).uniq.pluck(:year) | PositionMember.order(year: :desc).uniq.pluck(:year)

    @years.sort_by! { |y| -y }

    @this_year = DateHelper.year

    @all_board_members = BoardMember.where("year = ?", @year)

    @board_members = @all_board_members.select{ |m| m.supplementary == false }

    @supplementary_members = @all_board_members.select{ |m| m.supplementary == true }

    @member_ids = @all_board_members.where('member_id is not null').pluck(:member_id).uniq
    @names = @all_board_members.where('name is not null').pluck(:name).uniq

    @position_members = PositionMember.where('year = ?', @year)
    @ids = @position_members.select("MIN(id) as id").group(:member_id,:name).collect(&:id)
    @position_members = @position_members.select { |m| @ids.include? m.id }
    @position_members = @position_members.select{ |m| not @member_ids.include? m.member_id }
    @position_members = @position_members.select{ |m| not @names.include? m.name }

    @board_members = @board_members.sort_by { |f| f.priority_in_board_member_list(@year) }
    @supplementary_members = @supplementary_members.sort_by { |f| f.priority_in_board_member_list(@year) }
    @position_members = @position_members.sort_by { |f| f.priority_in_board_member_list(@year) }

    @text = Text.where('name = ?', 'Hallitus ja virkailijat').first
 end

 def new
    @board_member = BoardMember.new
    @members = Member.all.order(:firstname, :lastname)
    @this_year = DateHelper.year
 end

 def edit
    @board_member = BoardMember.find(params[:id])
    @members = Member.all.order(:firstname, :lastname)
 end

 def update
    @board_member = BoardMember.find(params[:id])
    if board_member_params[:member_id] and !board_member_params[:member_id].empty?
      @member = Member.find(board_member_params[:member_id])
      if params[:avatar] 
        @user = @member.user
        if @user and !@user.avatar_url
          @user.skip_password_validation = true
          @user.avatar = params[:avatar]
          @user.save!
        end
      end
    end
    @board_member.name = @board_member.get_name
    respond_to do |format|
      if @board_member.update(board_member_params)
        format.html { redirect_to '/board_members_and_positions', notice: "Hallituksen jäsentä muokattu" }
      else
        @alert = @board_member.errors
        @members = Member.all.order(:firstname, :lastname)
        format.html { render :new, status: :unprocessable_entity, location: edit_board_member_path }
      end
    end
 end

 def create
    @board_member = BoardMember.new(board_member_params)
    if board_member_params[:member_id] and !board_member_params[:member_id].empty?
      @member = Member.find(board_member_params[:member_id])
      if params[:avatar] 
        @user = @member.user
        if @user and !@user.avatar_url
          @user.skip_password_validation = true
          @user.avatar = params[:avatar]
          @user.save!
        end
      end
    end
    @board_member.name = @board_member.get_name
    respond_to do |format|
      if @board_member.save
        format.html { redirect_to '/hallitus?vuosi=' + @board_member.year.to_s, notice: "Hallituksen jäsen lisätty" }
      else
        @alert = @board_member.errors
        @members = Member.all.order(:firstname, :lastname)
        @this_year = DateHelper.year
        format.html { render :new, status: :unprocessable_entity, location: new_board_member_path }
      end
    end
 end

 def board_members_and_positions
   @board_members = BoardMember.all.order(year: :desc, supplementary: :asc, member_id: :asc)
   @position_members = PositionMember.all.order(year: :desc, member_id: :asc)
 end

 def destroy
    @member = BoardMember.find(params[:id])
    @member.destroy
    redirect_to '/board_members_and_positions', notice:  "Hallituksen jäsen poistettu"
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
    params.require(:board_member).permit(:member_id, :year, :name, :supplementary)
  end
    
end