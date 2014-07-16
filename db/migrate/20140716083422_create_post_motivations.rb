class CreatePostMotivations < ActiveRecord::Migration
  def change
    create_table :post_motivations do |t|
      t.string :title
      t.text :body
      t.text :short
      t.string :date

      t.timestamps
    end
  end
end
