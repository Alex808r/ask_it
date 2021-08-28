# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  email                 :string           not null
#  name                  :string
#  password_digest       :string
#  remember_token_digest :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
