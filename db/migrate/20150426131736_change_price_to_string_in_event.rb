class ChangePriceToStringInEvent < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :price, :string
  end
end
