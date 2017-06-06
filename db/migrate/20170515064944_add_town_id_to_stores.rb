class AddTownIdToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :town_id, :integer
    add_index :stores, :town_id
  end
end
