class AddAvatarToUser2 < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.attachment :avatar
    end
  end
end
