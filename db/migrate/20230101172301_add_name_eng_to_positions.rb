class AddNameEngToPositions < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :name_eng, :string
  end
end
