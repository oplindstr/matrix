class PagesController < ApplicationController

  def fuksiopas
  	@fuksijatuutorivastaava = Position.where('name = ?', 'Fuksi- ja Tuutorivastaava').first
    @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
  end

  def tuutorit
  	@fuksijatuutorivastaava = Position.where('name = ?', 'Fuksi- ja Tuutorivastaava').first
    @fuksijatuutorivastaavat = @fuksijatuutorivastaava.current_members
  end

end