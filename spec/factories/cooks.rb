FactoryGirl.define do
  factory :cook do
    first_name "Miguel"
    last_name "Cua"
    description "I have got mad skillz"
    sequence(:email) { |n| "miguel#{n}@hotmail.com" }
    password "password"
  end
end
