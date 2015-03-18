class DropUidFromHpStatistic < ActiveRecord::Migration
  def change
    remove_column :hp_statistics, :u_id
    add_column :hp_statistics, :hpUsername, :string
  end
end
