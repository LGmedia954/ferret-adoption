class AddOwneridToFerrets < ActiveRecord::Migration[6.1]
  def change
    add_column :ferrets, :owner_id, :integer
  end
end
