class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :user_id
      t.string :email
      t.text :information

      t.timestamps null: false
    end
  end
end
