class RemoveSendToFromReminder < ActiveRecord::Migration
  def change
    remove_column :reminders, :send_to, :string
  end
end
