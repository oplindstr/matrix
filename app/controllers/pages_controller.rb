class PagesController < ApplicationController
  before_action :set_locale, only: [:index]
  before_action :ensure_that_sub_admin, only: [:admin_tools]

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
    @events = Event.where('starttime >= ?', DateTime.now.midnight).order(:starttime, :endtime).limit(@event_count)
    @info = Text.where('name = ?', 'Etusivun info').first
    @tervetuloa = Text.where('name = ?', 'Tervetuloa').first

    @image = Image.where('name = ?', 'Etusivun kuva').first
  end

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
    @text = Text.where('name = ?', 'Fuksiopas').first
  end

  def komero
    @products = Product.all.order(:priority, :name)
    @text = Text.where('name = ?', 'Komero').first
  end

  def tenttiarkisto
    @document_group_category = DocumentGroupCategory.where('name = ?', 'Tenttiarkisto').first
    if @document_group_category.nil?
      redirect_to root_path
    else
      @document_group_category_id = @document_group_category.id
        @document_groups = DocumentGroup.where('document_group_category_id = ?', @document_group_category_id).order(:name)
      render :template => 'document_group_categories/show'
    end
  end

  def toiminta
    @this_year = Time.now.beginning_of_year
    @years = Event.where('starttime < ?', @this_year).order(starttime: :desc).pluck(:starttime).uniq{ |m| m.year }.map!{ |m| m.year }
    @text = Text.where('name = ?', 'Toiminta').first
  end

  def tuutorit
  	@virkatyyppi = PositionType.where('name = ?', 'Tuutorivastaava').first
    if @virkatyyppi
      @fuksijatuutorivastaava = Position.where('position_type = ?', @virkatyyppi).first
      if @fuksijatuutorivastaava
        @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
      end
    end
    @text = Text.where('name = ?', 'Tuutorit').first
  end

  def yhteystiedot
    @post = Text.where('name = ?', 'Postiosoite ja toimisto').first
    @other_info = Text.where('name = ?', 'Muut yhteystiedot').first
    @contact_positions = Position.where(show_in_contact_info: true).order(:priority)
  end

  def yrityksille
    @now = Time.now

    @this_year_anniversary = DateTime.new(@now.year,3,1)
    @this_year_anniversary += 1.days until @this_year_anniversary.wday == 1

    @next_anniversary = @now.year - 1995

    if @now >= @this_year_anniversary
      @next_anniversary += 1
    end

    @text = Text.where('name = ?', 'Yrityksille').first
  end

  def edunvalvonta
    @title = 'Edunvalvonta'
    generic_page()
  end

  def fuksille
    @text = Text.where('name = ?', 'Fuksille').first
  end

  def helpot_nopat
    @title = 'Helpot nopat'
    generic_page()
  end

  def hinnasto
    @title = 'Hinnasto'
    generic_page()
  end

  def historia
    @title = 'Historia'
    generic_page()
  end

  def jarjesto
    @text = Text.where('name = ?', 'Järjestö').first
  end

  def juhlat
    @title = 'Juhlat'
    generic_page()
  end

  def julkaisut
    @title = 'Julkaisut'
    generic_page()
  end

  def kerhot
    @text = Text.where('name = ?', 'Kerhot').first
  end

  def klusteri
    @text = Text.where('name = ?', 'Klusteri').first
  end

  def kulttuuri
    @title = 'Kulttuuri'
    generic_page()
  end

  def kurssikuvauksia
    @text = Text.where('name = ?', 'Kurssikuvauksia').first
  end

  def liikunta
    @title = 'Liikunta'
    generic_page()
  end

  def lomakkeet
    @title = 'Lomakkeet'
    generic_page()
  end

  def pelailu
    @title = 'Pelailu'
    generic_page()
  end

  def perinnetapahtumat
    @title = 'Perinnetapahtumat'
    generic_page()
  end

  def sahkopostilistat
    @text = Text.where('name = ?', 'Sähköpostilistat').first
  end

  def sanasto
    @text = Text.where('name = ?', 'Sanastoa').first
  end

  def tervehdys
    @title = 'Tervehdys'
    generic_page()
  end

  def tiedotuskanavat
    @title = 'Tiedotuskanavat'
    generic_page()
  end

  def tilat
    @title = 'Tilat'
    generic_page()
  end

  def toimitus
    @title = 'Toimitus'
    generic_page()
  end

  def tuotteet
    @title = 'Tuotteet'
    generic_page()
  end

  def turvallinen_tila
    @title = 'Turvallisemman tilan periaatteet'
    generic_page()
  end

  def tutkinto
    @title = 'Tutkinto & kurssit'
    generic_page()
  end

  def tyhja_joukko
    @title = 'Tyhjä Joukko'
    generic_page()
  end

  def virkailijaksi
    @text = Text.where('name = ?', 'Virkailijaksi').first
  end

  def yhteistyo
    @title = 'Yhteistyö'
    generic_page()
  end

  private

    def generic_page
      @text = Text.where('name = ?', @title).first
      render :template => 'pages/generic'
    end

    def set_locale
      @locale = I18n.locale
    end

end