class CreateMystories < ActiveRecord::Migration
  def change
    create_table :mystories do |t|
      t.string :name
      t.text :body
      t.string :picture1
      t.string :picture2
      t.string :picture3

      t.timestamps
    end
  end
end
