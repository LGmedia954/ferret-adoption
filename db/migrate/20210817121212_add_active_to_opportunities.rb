class AddActiveToOpportunities < ActiveRecord::Migration[6.1]
  def change
    add_column :opportunities, :active, :boolean, default: true
  end
end
