class Admin < ActiveRecord::Migration
  def up
    admin = User.new
    admin.first_name = "Admin"
    admin.last_name = "Admin"
    admin.username = "admin"
    admin.email = "admin@example.com"
    admin.phone_number = "410-440-0887"
    admin.password = "secret1!"
    admin.password_confirmation = "secret1!"
    admin.active = true
    admin.save!
  end

  def down
    admin = User.find_by_email "admin@example.com"
    User.delete admin
  end
end
