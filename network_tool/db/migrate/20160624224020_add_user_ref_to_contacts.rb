class AddUserRefToContacts < ActiveRecord::Migration
  def change
    add_index :contacts, [:user_id, :created_at]

  end
end
