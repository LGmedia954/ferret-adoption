class CreateAdoptionRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :adoption_requests do |t|
      t.integer :adopter_id
      t.integer :opportunity_id

      t.timestamps
    end
  end
end
