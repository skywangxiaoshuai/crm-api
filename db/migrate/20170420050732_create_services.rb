class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :company_name
      t.jsonb :district
      t.string :address
      t.string :contact
      t.string :contact_position
      t.string :contact_telephone
      t.text :contact_otherinfo
      t.text :remarks

      t.timestamps
    end
  end
end
