FactoryGirl.define do
  factory :cook do
    first_name "Miguel"
    last_name "Cua"
    description "I have got mad skillz"
    sequence(:email) { |n| "miguel#{n}@hotmail.com" }
    phone_number "1234567890"
    password "password"
  end
end
