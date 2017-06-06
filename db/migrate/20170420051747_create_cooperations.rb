class CreateCooperations < ActiveRecord::Migration[5.0]
  def change
    create_table :cooperations do |t|
      t.references :store, foreign_key: true, index: true
      t.references :service, foreign_key: true, index: true
      t.date :start_date
      t.integer :status
      t.text :remarks

      t.timestamps
    end
  end
end
