class CreateProjectsabouts < ActiveRecord::Migration
  def change
    create_table :projectsabouts do |t|
      t.string :name
      t.text :description
      t.string :picture1
      t.string :picture2
      t.string :picture3
      t.string :link

      t.timestamps
    end
  end
end
