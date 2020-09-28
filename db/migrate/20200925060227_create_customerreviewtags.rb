class CreateCustomerreviewtags < ActiveRecord::Migration[6.0]
  def change
    create_table :customerreviewtags do |t|
      t.references :customerreview, null: false, foreign_key: true
      t.string :producttag

      t.timestamps
    end
  end
end
