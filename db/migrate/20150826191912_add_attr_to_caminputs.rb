class AddAttrToCaminputs < ActiveRecord::Migration
  def change
  	add_column :caminputs, :angry, :string
    add_column :caminputs, :disgust, :string
    add_column :caminputs, :fear, :string
    add_column :caminputs, :happy, :string
    add_column :caminputs, :neutral, :string
    add_column :caminputs, :sad, :string
    add_column :caminputs, :surprise, :string
    add_column :caminputs, :canv, :text
  end
end
