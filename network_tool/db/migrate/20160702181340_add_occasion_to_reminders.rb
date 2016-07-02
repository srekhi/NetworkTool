class AddOccasionToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :occasion, :string
  end
end
