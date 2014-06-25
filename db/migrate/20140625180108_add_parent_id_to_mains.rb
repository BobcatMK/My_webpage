class AddParentIdToMains < ActiveRecord::Migration
  def change
    add_column :mains, :parent_id, :integer
  end
end
