class AddNameEngToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name_eng, :string
  end
end
