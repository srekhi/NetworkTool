class RemoveUserIdFromReminders < ActiveRecord::Migration
  def change
    remove_column :reminders, :user_id, :integer
  end
end
