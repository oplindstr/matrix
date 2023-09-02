class AddDescriptionToSettings < ActiveRecord::Migration[7.0]
  def change
  	add_column :settings, :descr, :string
  end
end
