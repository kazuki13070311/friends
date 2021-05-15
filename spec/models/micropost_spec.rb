# == Schema Information
#
# Table name: microposts
#
#  id          :bigint           not null, primary key
#  content     :string(255)      not null
#  description :text(65535)      not null
#  model       :string(255)      not null
#  name_type   :string(255)      not null
#  raid_time   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_microposts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Micropost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
