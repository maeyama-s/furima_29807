FactoryBot.define do
  factory :item do
    user_id                { Faker::Number.between(from: 1, to: 100) }
    title                  { Faker::String.random(length: 5..10) }
    explanation            { Faker::String.random(length: 5..10) }
    category_id            { Faker::Number.between(from: 2, to: 11) }
    item_condition_id      { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id    { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id       { Faker::Number.between(from: 2, to: 48) }
    days_until_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
