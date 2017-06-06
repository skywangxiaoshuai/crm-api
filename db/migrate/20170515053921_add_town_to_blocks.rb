class AddTownToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_reference :blocks, :town, foreign_key: true
  end
end
