class AddNextRunToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :next_run, :date
  end
end
