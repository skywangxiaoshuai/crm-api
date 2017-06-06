class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.integer :developer_id
      t.integer :operator_id
      t.string :name
      t.jsonb :district
      t.string :address
      t.string :contact
      t.string :contact_position
      t.string :contact_info
      t.text :remarks

      t.timestamps
    end
  end
end
