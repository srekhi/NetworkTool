class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :time_from_now
      t.string :send_to

      t.timestamps null: false
    end
  end
end
