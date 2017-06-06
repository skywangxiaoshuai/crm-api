 class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :block, foreign_key: true, index: true
      t.integer :enterprise_id
      t.integer :developer_id, index: true
      t.integer :operator_id, index: true
      t.jsonb :category
      t.jsonb :district
      t.string :name
      t.string :address
      t.boolean :current_weixin
      t.boolean :current_alipay
      t.boolean :current_aggre
      t.boolean :current_bank
      t.boolean :our_weixin
      t.boolean :our_alipay
      t.boolean :our_aggre
      t.boolean :our_bank
      t.string :contact
      t.string :contact_position
      t.string :contact_info
      t.text :remarks

      t.timestamps
    end

  end
end
