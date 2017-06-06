class AddDistrictToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :blocks, :district, :jsonb
  end
end
