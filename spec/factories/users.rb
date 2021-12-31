FactoryBot.define do
  factory :user do
    nickname
    email
    password
    password_confirmation
    family_name
    first_name
    phonetic_family_name
    phonetic_first_name
    birth_date
  end
end