FactoryGirl.define do
  factory :post do
    sequence(:date) { |n| "May #{n}, 2016"}
    start_time "10:00 am"
    end_time "11:00 pm"
    wage "$10"
    description "Fry station"
    chef
  end
end
