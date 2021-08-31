class AddReqToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :req_id, :integer
  end
end
