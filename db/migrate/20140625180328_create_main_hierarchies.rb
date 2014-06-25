class CreateMainHierarchies < ActiveRecord::Migration
  def change
    create_table :main_hierarchies, :id => false do |t|
      t.integer :ancestor_id, :null => false
      t.integer :descendant_id, :null => false
      t.integer :generations, :null => false
    end
    
    add_index :main_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => "comment_anc_desc_udx"
              
    add_index :main_hierarchies, [:descendant_id],
              :name => "comment_desc_idx"
  end
end
