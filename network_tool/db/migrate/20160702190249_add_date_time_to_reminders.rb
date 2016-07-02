class AddDateTimeToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :date, :datetime
  end
end
