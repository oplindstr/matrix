class AddDescrEngToEvents < ActiveRecord::Migration
  def change
    add_column :events, :descr_eng, :text
  end
end
