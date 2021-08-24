class AddUidToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :uid, :string
  end
end
