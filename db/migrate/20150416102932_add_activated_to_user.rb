class AddActivatedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activated, :boolean
  end
end
