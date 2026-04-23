FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { password }
    username { Faker::Name.name }
    profile { "自己紹介" }
    affiliation { "会社" }
    position { "エンジニア" }
  end
end