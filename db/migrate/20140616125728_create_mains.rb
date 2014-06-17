class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
