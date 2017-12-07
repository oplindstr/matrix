class PagesController < ApplicationController
  before_action :ensure_that_sub_admin, only: [:admin_tools]

  def admin_tools

  end

  def fuksiopas
    @virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
    if @virkatyyppi
    	@fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
    	if @fuksijatuutorivastaava
        @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
      end
    end
  end

  def index
    @news_count = get_setting('INDEX_NEWS_COUNT')
    if !@news_count
      @news_count = 5
    end
    @event_count = get_setting('INDEX_EVENT_COUNT')
    if !@event_count
      @event_count = 5
    end
    @news = News.all.order(priority: :desc, id: :desc).limit(@news_count)
    @events = Event.where('starttime > ?', Time.now).order(starttime: :asc).limit(@event_count)
  end

  def toiminta
    @this_year = Time.now.year
    @years = Event.where('starttime < ?', @this_year).order(starttime: :desc).pluck(:starttime).uniq{ |m| m.year }.map!{ |m| m.year }
  end

  def tuutorit
  	@virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
    if @virkatyyppi
      @fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
      if @fuksijatuutorivastaava
        @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
      end
    end
  end

end