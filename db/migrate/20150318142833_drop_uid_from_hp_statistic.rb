class DropUidFromHpStatistic < ActiveRecord::Migration
  def change
    remove_column :HpStatistics, :u_id
    add_column :HpStatistics, :hpUsername, :string
  end
end
