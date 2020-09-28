class CreateProductlists < ActiveRecord::Migration[6.0]
  def change
    create_table :productlists do |t|
      t.string :title
      t.string :body
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option1val
      t.string :option2val
      t.string :option3val

      t.timestamps
    end
  end
end
