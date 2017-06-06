class RemoveTownFromBlocks < ActiveRecord::Migration[5.0]
  def change
    remove_reference :blocks, :town, foreign_key: true
  end
end
