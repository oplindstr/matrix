class DropSettings < ActiveRecord::Migration
  def change
  	drop_table(:stringresources)
  	drop_table(:settings)
  end
end