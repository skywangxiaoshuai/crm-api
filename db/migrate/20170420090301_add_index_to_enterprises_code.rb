class AddIndexToEnterprisesCode < ActiveRecord::Migration[5.0]
  def change
    add_index :enterprises, :code, unique: true
  end
end
