class AddImageProductDetailsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :asset_uid, :string
    add_column :products, :asset_name, :string
  end
end
