FactoryBot.define do
  factory :comment do
    text { "テストコメント" }
    association :user
    association :post
  end
end
