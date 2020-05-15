# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  carreer                :string(255)
#  clan                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  level                  :integer
#  lightlevel             :integer
#  model                  :string(255)
#  name                   :string(255)
#  profession             :string(255)
#  profile                :text(65535)
#  psnid                  :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sex                    :string(255)
#  steam                  :string(255)
#  strength               :float(24)
#  style                  :string(255)
#  timezone               :string(255)
#  twitter                :string(255)
#  voice                  :string(255)
#  weapon                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
end
