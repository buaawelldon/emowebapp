class AddEmopro2bToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :angry, :string
    add_column :bookmarks, :disgust, :string
    add_column :bookmarks, :fear, :string
    add_column :bookmarks, :happy, :string
    add_column :bookmarks, :neutral, :string
    add_column :bookmarks, :sad, :string
    add_column :bookmarks, :surprise, :string
  end
end
