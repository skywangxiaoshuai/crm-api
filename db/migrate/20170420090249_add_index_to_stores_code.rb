class AddIndexToStoresCode < ActiveRecord::Migration[5.0]
  def change
    add_index :stores, :code, unique: true
  end
end
