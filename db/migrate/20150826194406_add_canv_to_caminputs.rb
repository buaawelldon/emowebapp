class AddCanvToCaminputs < ActiveRecord::Migration
  def change
  	    add_column :caminputs, :canv, :text

  end
end
