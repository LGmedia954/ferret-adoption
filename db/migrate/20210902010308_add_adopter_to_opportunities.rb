class AddAdopterToOpportunities < ActiveRecord::Migration[6.1]
  def change
    add_column :opportunities, :adopter_id, :integer, array: true, default: []
  end
end
