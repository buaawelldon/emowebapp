class AddAttachmentPhotoToBookmarks < ActiveRecord::Migration
  def self.up
    change_table :bookmarks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :bookmarks, :photo
  end
end
