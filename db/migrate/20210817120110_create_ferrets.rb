class CreateFerrets < ActiveRecord::Migration[6.1]
  def change
    create_table :ferrets do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :color
      t.string :health
      t.text :description

      t.timestamps
    end
  end
end
