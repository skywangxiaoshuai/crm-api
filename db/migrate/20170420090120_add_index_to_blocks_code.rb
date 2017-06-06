class AddIndexToBlocksCode < ActiveRecord::Migration[5.0]
  def change
    add_index :blocks, :code, unique: true
  end
end
