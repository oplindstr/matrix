class DropHpStatistic < ActiveRecord::Migration
  def change
    drop_table :hp_statistics
  end
end
