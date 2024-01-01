class AddTgnickToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :tg_nick, :string
  end
end
