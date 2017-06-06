class ChangeColumnContactInfoTextToEnterprises < ActiveRecord::Migration[5.0]
  def change
    change_column :enterprises, :contact_info, :text
  end
end
