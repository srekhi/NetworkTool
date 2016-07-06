class AddContactRefToReminders < ActiveRecord::Migration
  def change
    add_reference :reminders, :contact, index: true, foreign_key: true
  end
end
