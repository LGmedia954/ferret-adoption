class AddHomeToFerrets < ActiveRecord::Migration[6.1]
  def change
    add_column :ferrets, :home, :boolean, default: false
  end
end
