class AddNameEngToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :name_eng, :string
  end
end
