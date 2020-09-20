FactoryBot.define do
  factory :item_sell do
    user_id        { Faker::Number.between(from: 1, to: 100) }
    item_id        { Faker::Number.between(from: 1, to: 100) }
    purchase_id    { Faker::Number.between(from: 1, to: 100) }
    post_code      { '123-4567' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    city           { Gimei.address.city.kanji }
    adress         { Gimei.address.town.kanji }
    building_name  { Gimei.address.town.to_s }
    phone_number   { Faker::Number.number(digits: 11) }
    token          { 'tok_' + Faker::Internet.password(min_length: 28, max_length: 28) }
  end
end
