class AddPostIdToMains < ActiveRecord::Migration
  def change
    add_column :mains, :post_id, :integer
  end
end
