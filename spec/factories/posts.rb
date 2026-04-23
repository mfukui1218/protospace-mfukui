FactoryBot.define do
  factory :post do
    title { "テスト投稿" }
    catchcopy { "キャッチコピー" }
    content { "内容" }
    association :user

    after(:build) do |post|
      post.image.attach(
        io: StringIO.new("fake image content"),
        filename: 'test.png',
        content_type: 'image/png'
      )
    end
  end
end