# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Default presentation data

# db/seeds.rb
require 'faker'

# Clear existing data
User.destroy_all
Presentation.destroy_all
Evaluation.destroy_all

# Create dummy users
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    admin: [true, false].sample
  )
end

# Create dummy presentations
users = User.all

10.times do
  presentation = Presentation.create!(
    title: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user: users.sample
  )

  # Create dummy evaluations for each presentation
  rand(1..5).times do
    Evaluation.create!(
      points: rand(1..10),
      feedback: Faker::Lorem.sentence,
      user: users.sample,
      presentation: presentation
    )
  end
end
