class AddIntervalToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :next_run, :string
  end
end
