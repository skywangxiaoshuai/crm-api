class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.integer :service_id, index: true
      t.references :store, foreign: true, index: true
      t.date :date
      t.integer :trade_num
      t.float :trade_sum

      t.timestamps
    end
  end
end
