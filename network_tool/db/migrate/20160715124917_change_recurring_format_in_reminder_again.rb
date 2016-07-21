class ChangeRecurringFormatInReminderAgain < ActiveRecord::Migration
  def up
    #change_column :reminders, :recurring, :string
    execute 'ALTER TABLE reminders ALTER COLUMN recurring TYPE varchar USING (recurring::varchar)'

  end

  def down
    #change_column :reminders, :recurring, :integer
    execute 'ALTER TABLE reminders ALTER COLUMN recurring TYPE integer USING (recurring::integer)'

  end
end
