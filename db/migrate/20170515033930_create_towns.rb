class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :district_id

      t.timestamps
    end
    add_index :towns, :name
    add_index :towns, :district_id
  end
end
