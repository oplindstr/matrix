class AddAbbreviationToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :abbreviation, :string
  end
end
