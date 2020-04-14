FactoryBot.define do
  factory :post do
    content { "テストタイトル" }
    description {"この投稿はテスト投稿です"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test_image.jpg'),'image/jpg')}
    user
  end
end
