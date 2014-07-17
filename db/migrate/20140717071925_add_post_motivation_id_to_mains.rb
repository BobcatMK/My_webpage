class AddPostMotivationIdToMains < ActiveRecord::Migration
  def change
    add_column :mains, :post_motivation_id, :integer
  end
end
