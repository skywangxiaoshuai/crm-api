class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      # t.references :user, foreign_key: true, index: true
      t.integer :operator_id, index: true
      t.integer :developer_id, index: true
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
