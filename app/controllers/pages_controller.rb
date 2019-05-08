class PagesController < ApplicationController
  before_action :ensure_that_sub_admin, only: [:admin_tools]

  def admin_tools

  end

  def fuksille
    @text = Text.where('name = ?', 'Fuksille').first
  end

  def fuksiopas
    @virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
    if @virkatyyppi
    	@fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
    	if @fuksijatuutorivastaava
        @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
      end
    end
    @text = Text.where('name = ?', 'Fuksiopas').first
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
    @info = Text.where('name = ?', 'Etusivun info').first
  end

  def toiminta
    @this_year = Time.now.beginning_of_year
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

  def yrityksille
    @now = Time.now

    @this_year_anniversary = DateTime.new(@now.year,3,1)
    @this_year_anniversary += 1.days until @this_year_anniversary.wday == 1

    @next_anniversary = @now.year - 1995

    if @now >= @this_year_anniversary
      @next_anniversary += 1
    end

    @next_anniversary
  end

  def komero
    @products = Product.all.order(:priority, :name)
  end

  def sanasto
    @text = Text.where('name = ?', 'Sanastoa').first
  end

  def yhteystiedot
    @other_info = Text.where('name = ?', 'Muut yhteystiedot').first
    @contact_positions = Position.where(show_in_contact_info: true).order(:priority)
  end

end