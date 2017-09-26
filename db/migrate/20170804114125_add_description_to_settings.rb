class AddDescriptionToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :descr, :string
  end
end
