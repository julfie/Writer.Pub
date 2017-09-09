class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.int :project_id
      t.int :role_id
      t.int :user_id
      t.int :invite_num

      t.timestamps null: false
    end
  end
end
