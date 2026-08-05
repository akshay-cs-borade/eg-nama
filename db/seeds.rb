# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


[
  { email: 'scb@nama.com', password: 'password123', admin: true },
  { email: 'csb@nama.com', password: 'password123', admin: false },
  { email: 'ak@nama.com', password: 'password123', admin: false },
  { email: 'so@nama.com', password: 'password123', admin: false }
].each do |attrs|
  user = User.find_or_initialize_by(email: attrs[:email])

  user.password = attrs[:password]
  user.password_confirmation = attrs[:password]
  user.admin = attrs[:admin]

  user.save!
end