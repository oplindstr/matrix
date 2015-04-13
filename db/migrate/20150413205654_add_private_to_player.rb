class AddPrivateToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :private, :boolean
  end
end
