class ChangeRecurringFormatInReminder < ActiveRecord::Migration
  def up
    change_column :reminders, :recurring, :integer
  end

  def down
    change_column :reminders, :recurring, :boolean
  end
end
