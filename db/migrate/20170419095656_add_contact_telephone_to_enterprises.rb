class AddContactTelephoneToEnterprises < ActiveRecord::Migration[5.0]
  def change
    add_column :enterprises, :contact_telephone, :string
    rename_column :enterprises, :contact_info, :contact_otherinfo
  end
end
