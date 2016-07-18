class AddRecurringToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :recurring, :boolean
  end
end
