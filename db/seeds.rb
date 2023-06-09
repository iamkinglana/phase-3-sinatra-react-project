require 'faker'

puts "🌱 Seeding data..."

# Create eateries
eateries = []
rand(1..5).times do
  eatery = Eatery.create(
    name: Faker::Restaurant.name,
    location: Faker::Address.city,
    rating: rand(1..5),
    picture: Faker::LoremPixel.image(size: "200x200", is_gray: false, category: 'food'),
  )
  eateries << eatery
end

# Create reviews for each eatery
eateries.each do |eatery|
  rand(1..10).times do
    Review.create(
      picture: Faker::LoremPixel.image(size: "200x200", is_gray: false, category: 'food'),
      comment: Faker::Lorem.sentence,
      eatery_id: eatery.id
    )
  end
end

puts "🌱 Done seeding"

