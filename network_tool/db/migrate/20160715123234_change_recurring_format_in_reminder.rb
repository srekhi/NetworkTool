class ChangeRecurringFormatInReminder < ActiveRecord::Migration
  def up
    #change_column :reminders, :recurring, :integer
    execute 'ALTER TABLE reminders ALTER COLUMN recurring TYPE integer USING (recurring::integer)'

  end

  def down
    #change_column :reminders, :recurring, :boolean
    execute 'ALTER TABLE reminders ALTER COLUMN recurring TYPE boolean USING (recurring::boolean)'

  end
end
