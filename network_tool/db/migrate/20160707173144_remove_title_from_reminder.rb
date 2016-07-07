class RemoveTitleFromReminder < ActiveRecord::Migration
  def change
    remove_column :reminders, :title, :string
  end
end
