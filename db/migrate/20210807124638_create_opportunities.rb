class CreateOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table :opportunities do |t|
      t.integer :ferret_id
      t.integer :owner_id
      t.string :title
      t.text :circumstance

      t.timestamps
    end
  end
end
