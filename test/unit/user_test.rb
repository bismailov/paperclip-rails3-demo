# == Schema Information
#
# Table name: users
#
#  id                            :integer          not null, primary key
#  name                          :string(255)
#  email                         :string(255)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  video_attachment_file_name    :string(255)
#  video_attachment_content_type :string(255)
#  video_attachment_file_size    :integer
#  video_attachment_updated_at   :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
