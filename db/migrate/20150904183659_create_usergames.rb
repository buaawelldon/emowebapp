class CreateUsergames < ActiveRecord::Migration
  def change
    create_table :usergames do |t|
      t.string :name
      t.string :email
      t.string :score
      t.string :rank
      t.text :ft1
      t.text :ft2
      t.text :ft3
      t.text :ft4
      t.text :ft5
      t.text :ft6
      t.text :ft7
      t.string :path1
      t.string :path2
      t.string :path3
      t.string :path4
      t.string :path5
      t.string :path6
      t.string :path7

      t.timestamps
    end
  end
end
