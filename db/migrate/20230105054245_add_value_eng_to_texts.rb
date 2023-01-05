class AddValueEngToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :value_eng, :text
  end
end
