FactoryGirl.define do
  factory :chef do
    first_name "Dan"
    last_name "Taft"
    restaurant_name "Poutine for Dayz"
    address "33 Harrison Avenue"
    city "Boston"
    state "MA"
    zip "02111"
    description "homemade poutine"
    phone_number "5555555555"
    sequence(:email) { |n| "DTizzle#{n}@hotmail.com" }
    password "password"
  end
end
