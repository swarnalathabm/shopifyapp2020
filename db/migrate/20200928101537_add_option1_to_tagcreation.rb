class AddOption1ToTagcreation < ActiveRecord::Migration[6.0]
  def change
    add_column :tagcreations, :productoption1, :string
    add_column :tagcreations, :productvalue1, :string
    add_column :tagcreations, :productoption2, :string
    add_column :tagcreations, :productvalue2, :string
  end
end
