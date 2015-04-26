class AddHoursToEventFields < ActiveRecord::Migration
  def change
    change_column :events, :starttime, :datetime
    change_column :events, :endtime, :datetime
    change_column :events, :signup_start, :datetime
    change_column :events, :signup_end, :datetime
    change_column :events, :signup_cancellable_until, :datetime
  end
end
