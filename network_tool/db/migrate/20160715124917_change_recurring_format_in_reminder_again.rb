class ChangeRecurringFormatInReminderAgain < ActiveRecord::Migration
  def up
    change_column :reminders, :recurring, :string
  end

  def down
    change_column :reminders, :recurring, :integer
  end
end
