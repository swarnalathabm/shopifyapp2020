class CreateCustomerreviews < ActiveRecord::Migration[6.0]
  def change
    create_table :customerreviews do |t|
      t.string :customertype
      t.string :customername
      t.string :customeremail
      t.integer :reviewrating
      t.string :reviewbody
      t.string :publish
      t.integer :productid
      t.integer :reviewid

      t.timestamps
    end
  end
end
