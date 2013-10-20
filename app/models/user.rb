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

class User < ActiveRecord::Base
  attr_accessible :email, :name, :video_attachment

  has_attached_file :video_attachment

end
