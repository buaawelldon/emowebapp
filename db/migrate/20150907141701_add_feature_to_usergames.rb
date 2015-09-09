class AddFeatureToUsergames < ActiveRecord::Migration
  def change
  	add_column :usergames, :angry, :string
    add_column :usergames, :disgust, :string
    add_column :usergames, :fear, :string
    add_column :usergames, :happy, :string
    add_column :usergames, :neutral, :string
    add_column :usergames, :sad, :string
    add_column :usergames, :surprise, :string
	end	
end

