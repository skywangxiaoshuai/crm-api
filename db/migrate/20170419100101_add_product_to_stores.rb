class AddProductToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :product, :string
    add_column :stores, :contact_telephone, :string
    remove_column :stores, :current_weixin
    remove_column :stores, :current_alipay
    remove_column :stores, :current_aggre
    remove_column :stores, :current_bank
    remove_column :stores, :our_weixin
    remove_column :stores, :our_alipay
    remove_column :stores, :our_aggre
    remove_column :stores, :our_bank
    rename_column :stores, :contact_info, :contact_otherinfo
  end
end
