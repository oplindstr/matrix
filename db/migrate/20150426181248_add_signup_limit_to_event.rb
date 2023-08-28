class AddSignupLimitToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :signup_limit, :integer
  end
end
