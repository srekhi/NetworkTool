class ChangeDateTimeToDateInReminders < ActiveRecord::Migration
  def up
    change_column :reminders, :date, :date
  end

  def down
    change_column :my_table, :date, :datetime
  end
end
