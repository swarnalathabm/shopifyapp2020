class CreateTagcreations < ActiveRecord::Migration[6.0]
  def change
    create_table :tagcreations do |t|
      t.string :producttitle
      t.string :productoption
      t.string :productvalue
      t.integer :producttagid
      t.string :producttag

      t.timestamps
    end
  end
end
