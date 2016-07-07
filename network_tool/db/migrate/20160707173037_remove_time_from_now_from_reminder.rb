class RemoveTimeFromNowFromReminder < ActiveRecord::Migration
  def change
    remove_column :reminders, :time_from_now, :string
  end
end
