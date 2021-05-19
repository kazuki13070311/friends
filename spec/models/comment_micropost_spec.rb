# == Schema Information
#
# Table name: comment_microposts
#
#  id           :bigint           not null, primary key
#  comment      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  micropost_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comment_microposts_on_micropost_id  (micropost_id)
#  index_comment_microposts_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (micropost_id => microposts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe CommentMicropost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
