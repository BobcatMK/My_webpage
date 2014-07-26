class AddNameAffiliateLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name_affiliate_link, :string
  end
end
