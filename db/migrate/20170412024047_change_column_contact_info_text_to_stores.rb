class ChangeColumnContactInfoTextToStores < ActiveRecord::Migration[5.0]
  def change
    change_column :stores, :contact_info, :text
  end
end
