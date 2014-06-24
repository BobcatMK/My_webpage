class AddImageUrlToMains < ActiveRecord::Migration
  def change
    add_column :mains, :image_url, :string
  end
end
