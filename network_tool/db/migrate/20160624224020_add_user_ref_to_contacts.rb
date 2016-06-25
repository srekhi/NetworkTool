class AddUserRefToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :user, index: true, foreign_key: true
    add_index :microposts, [:user_id, :created_at]

  end
end
