class AddSignupLimitToEvent < ActiveRecord::Migration
  def change
    add_column :events, :signup_limit, :integer
  end
end
