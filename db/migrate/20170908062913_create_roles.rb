class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :Name
      t.Boolean :Active

      t.timestamps null: false
    end
  end
end
