class AddValueEngToTexts < ActiveRecord::Migration[7.0]
  def change
    add_column :texts, :value_eng, :text
  end
end
