class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      #t.integer :user_id
      t.string :email
      t.text :information

      t.timestamps null: false
    end
    #adding created at to retrieve contacts associated
    #with given user id in reverse order of creation
  end
end
