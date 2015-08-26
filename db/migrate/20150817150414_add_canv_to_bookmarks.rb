class AddCanvToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :canv, :text
  end
end
