class AddAttachmentPhotoToBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.attachment :photo
      t.string :title
      t.string :url
    end
  end

  def self.down
    remove_attachment :bookmarks, :photo
  end
end
