class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :Reminder

      t.timestamps null: false
    end
  end
end
