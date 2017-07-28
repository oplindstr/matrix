class PagesController < ApplicationController

  before_action :ensure_that_admin, only: [:admin_tools]

  def fuksiopas
  	@fuksijatuutorivastaava = Position.where('name = ?', 'Fuksi- ja Tuutorivastaava').first
  	if @fuksijatuutorivastaava
      @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
    end
  end

  def tuutorit
  	@fuksijatuutorivastaava = Position.where('name = ?', 'Fuksi- ja Tuutorivastaava').first
    if @fuksijatuutorivastaava
      @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
    end
  end

  def admin_tools

  end

end