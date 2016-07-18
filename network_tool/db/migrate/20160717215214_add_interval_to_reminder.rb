class AddIntervalToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :interval, :string
  end
end
