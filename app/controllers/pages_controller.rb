class PagesController < ApplicationController

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

end