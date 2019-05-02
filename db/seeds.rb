# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Book.create!(
    title: 'emotion java',
    publish_on: (Time.zone.now + Random.rand(0..10)).to_s,
    sheets: Random.rand(60..500),
    price: Random.rand(1000..7000),
    image: open("#{Rails.root}/app/assets/images/book_sample#{Random.rand(0..2)}.jpg")
  )
end