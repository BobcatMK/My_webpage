class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :short_description
      t.text :long_description
      t.string :affiliate_link
      t.string :picture1
      t.string :picture2
      t.string :picture3
      t.string :picture4

      t.timestamps
    end
  end
end
