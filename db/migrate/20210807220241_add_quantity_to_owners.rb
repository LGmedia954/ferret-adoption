class AddQuantityToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :quantity, :integer
  end
end
