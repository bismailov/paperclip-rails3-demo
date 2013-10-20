class AddAttachmentVideoAttachmentToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :video_attachment
    end
  end

  def self.down
    drop_attached_file :users, :video_attachment
  end
end
