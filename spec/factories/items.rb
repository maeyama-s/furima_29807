FactoryBot.define do
  factory :item do
    user_id                { Faker::Number.between(from: 1, to: 100) }
    title                  { Faker::String.random(length: 5..10) }
    explanation            { Faker::String.random(length: 5..10) }
    category_id            { Faker::Number.between(from: 1, to: 10) }
    item_condition_id      { Faker::Number.between(from: 1, to: 6) }
    shipping_charges_id    { Faker::Number.between(from: 1, to: 2) }
    shipping_area_id       { Faker::Number.between(from: 1, to: 47) }
    days_until_shipping_id { Faker::Number.between(from: 1, to: 3) }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    association :category

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/star.png'), filename: 'test_image.png')
    end
  end
end
