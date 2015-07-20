class AddImageToBookmarks < ActiveRecord::Migration
  def change
    add_attachment :bookmarks, :photo
  end
end
