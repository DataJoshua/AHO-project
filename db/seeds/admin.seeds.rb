after :regions do
  region = Region.first

  admin_attr = {
    email: "admin@example.com",
    password: "abcdF2!",
    region_id: region.id
  }

  admin = User.create!(admin_attr)

  admin.add_role :admin
end