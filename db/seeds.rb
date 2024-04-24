# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Devise created users, needs email and password
User.destroy_all
p "Confirmed #{User.count} User records are left."

User.create!([{
  email: "jack@test.com",
  name: "Jack",
  password: "jack456",
}])

p "Created #{User.count} users"

# Devise created admin, needs email and password
Admin.destroy_all
p "Confirmed #{Admin.count} admin records are left.",{
  name: "Git"
},

Admin.create!({
  email: "admin@admin.com",
  password: "admin456"
})

p "Created #{Admin.count} admins"

# Need some categories
Category.destroy_all
p "Confirmed #{Category.count} category records are left."

Category.create!([{
  name: "Ruby"
},{
  name: "Rails"
},{
  name: "AWS"
},{
  name: "Azure"
},{
  name: "Git"
},{
  name: "General"
}])
p "Created #{Category.count} categories"

BlogPost.destroy_all
p "Confirmed #{BlogPost.count} blog post records are left."
BlogPost.create!(title: "Hello World", content: "This is the first post", user_id: User.first.id, category_id: Category.first.id)
p "Created #{BlogPost.count} blog posts"
