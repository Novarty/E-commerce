class AddAttachmentAvatarToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :avatar
    add_attachment :managers, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
    remove_attachment :managers, :avatar
  end
end
