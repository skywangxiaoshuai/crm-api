class AddCodeToEnterprises < ActiveRecord::Migration[5.0]
  def change
    add_column :enterprises, :code, :string, index: true
  end
end
