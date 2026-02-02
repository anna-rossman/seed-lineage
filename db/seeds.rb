# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Seed.count == 0
  root1 = Seed.create!(name: "Root A")
  root2 = Seed.create!(name: "Root B")

  Seed.create!(
    name: "First Generation",
    parent_one: root1,
    parent_two: root2
  )
end
