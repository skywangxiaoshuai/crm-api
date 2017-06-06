class AddCodeToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :code, :string, index: true
  end
end
