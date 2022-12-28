class AddNameEngToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name_eng, :string
  end
end
