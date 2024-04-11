after :regions do
  admin_attr = {
    email: "admin@example.com",
    password: "abcdF2!"
  }

  admin = User.new(admin_attr)
  admin.admin_created = true

  admin.save
  admin.add_role :admin
end
