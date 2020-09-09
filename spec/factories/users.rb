FactoryBot.define do
  factory :user do
    nickname              {"まえ"}
    email                 {"mae@gmail.com"}
    password              {"12345a"}
    password_confirmation {password}
    family_name           {"前"}
    first_name            {"祥"}
    family_name_katakana  {"マエ"}
    first_name_katakana   {"ショウ"}
    birthday              {"1996-06-01"}
  end
end