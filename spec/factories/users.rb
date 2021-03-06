FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "abc123" }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_name_katakana  { Gimei.last.katakana }
    first_name_katakana   { Gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
