class CreateCaminputs < ActiveRecord::Migration
  def change
    create_table :caminputs do |t|
      t.string :username
      t.string :type

      t.timestamps
    end
  end
end
