# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Position.create!name: "phuc vu", description: "phuc vu mon an", salary: 5_000_000
Position.create!name: "thu ngan", description: "thu tien", salary: 5_000_000
Position.create!name: "bao ve", description: "trong xe", salary: 5_000_000
Position.create!name: "dau bep", description: "nau an", salary: 7_000_000

User.create!name: "nxy assasin", email: "nvt94.ptit@gmail.com",
  password: "xxxxxx", password_confirmation: "xxxxxx",
  address: "address", phone_number: "0987654321", gender: :male,
  activated: true, permission: :admin, position: nil,
  activated_at: Time.zone.now,
  birth_date: Faker::Date.birthday

20.times do |n|
  name = Faker::Name.last_name
  email = "example_#{n}@gmail.com"
  address = Faker::Lorem.sentence 10
  phone_number = Faker::PhoneNumber.cell_phone
  gender = ["male", "female", "other"].sample
  date = Faker::Date.birthday
  permission = [:user, :staff].sample
  if permission == :staff
    position = Position.all.sample
  end
  User.create!name: name, email: email, address: address, phone_number: phone_number, gender: gender,
    password: "xxxxxx", password_confirmation: "xxxxxx",
    activated: [true, false].sample,
    activated_at: Time.zone.now,
    birth_date: date, permission: permission, position: position || nil
end

10.times do
  Table.create!is_taken: false
end

10.times do
  Reservation.create!user: User.all.sample, table: Table.all.sample,
    numbers_people: (1..5).to_a.sample, is_arrived: false,
    date_time: DateTime.now
end

Category.create!name: "food", description: "no des", is_display: true
Category.create!name: "drink", description: "no des", is_display: true
Category.create!name: "main dishes", description: "no des", is_display: true, category: Category.first
Category.create!name: "dessert", description: "no des", is_display: true, category: Category.first
Category.create!name: "appetizer", description: "no des", is_display: true, category: Category.first
Category.create!name: "alcohol", description: "no des", is_display: true, category: Category.second
Category.create!name: "soft drink", description: "no des", is_display: true, category: Category.second

31.times do |n|
  Dish.create! name: Faker::Lorem.words(2).reduce(:+), description: Faker::Lorem.sentence,
    price: (1..10).to_a.sample * 10_000, promotion: (0..100).to_a.sample,
    is_display: true, category: Category.all.sample,
    image: File.open("public/uploads/dish/image/#{n+1}/food-#{n+1}.jpg")
end

20.times do
  ReservedDish.create! reservation: Reservation.all.sample, dish: Dish.all.sample,
    quantity: (1..5).to_a.sample
end

staffs = User.all_staff
staffs.each {|staff| Salary.create! salary: staff.position.salary, from_date: DateTime.now - 30, to_date: DateTime.now, user: staff}
