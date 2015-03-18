class DropUidFromHpStatistic < ActiveRecord::Migration
  def change
    remove_column :Hp_Statistics, :u_id
    add_column :Hp_Statistics, :hpUsername, :string
  end
end
