class RemoveTownIdFromStores < ActiveRecord::Migration[5.0]
  def change
    remove_index :stores, :town_id
    remove_column :stores, :town_id, :integer
  end
end
