class PagesController < ApplicationController
  before_action :ensure_that_admin, only: [:admin_tools]

  def fuksiopas
    @virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
  	@fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
  	if @fuksijatuutorivastaava
      @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
    end
  end

  def tuutorit
  	@virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
    @fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
    if @fuksijatuutorivastaava
      @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
    end
  end

  def toiminta
    @years = Event.all.order(starttime: :desc).pluck(:starttime).uniq{ |m| m.year }.map!{ |m| m.year }
  end

  def admin_tools

  end

end