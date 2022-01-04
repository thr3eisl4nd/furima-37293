FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name { "田中" }
    first_name { "太郎" }
    phonetic_family_name { "タナカ" }
    phonetic_first_name { "タロウ" }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 60) }
  end
end