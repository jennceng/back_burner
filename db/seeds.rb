20.times do |i|
  chef = Chef.create(
    first_name: Faker::Name.name.split.first,
    last_name: Faker::Name.name.split.last,
    restaurant_name: Faker::Hipster.words(3).join(" "),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    description: Faker::Hipster.words(5),
    email: i.to_s + Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "password"
  )
  3.times do
    Post.create(
      chef: chef,
      date: "#{Faker::Date.forward(50)}",
      start_time: "2:00 pm",
      end_time: "12:00 am",
      wage: "$12",
      description: Faker::Hipster.sentence
    )
  end
end

10.times do |i|
  cook = Cook.create(
    first_name: Faker::Name.name.split.first,
    last_name: Faker::Name.name.split.last,
    email: (i + 10).to_s + Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "password",
    description: "I have mad mad skillz",
  )

  Signup.create(post: Post.first, cook: cook)
end

Chef.first.update(email: "chef@gmail.com")
Chef.first.update(email: "cook@gmail.com")
