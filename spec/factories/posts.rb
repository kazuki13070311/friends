# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :string(255)
#  description :text(65535)
#  image       :string(255)
#  post_image  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    content { 'テストタイトル' }
    description { 'この投稿はテスト投稿です' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg'), 'image/jpg') }
    user
  end
end
