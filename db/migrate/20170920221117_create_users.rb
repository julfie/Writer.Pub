class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :username
      t.boolean :active, default: true
      t.string :provider
      t.string :uid
      # add_index :users, :provider
      # add_index :users, :uid
      # add_index :users, [:provider, :uid], unique: true

#      t.timestamps null: false
    end
  end
end
