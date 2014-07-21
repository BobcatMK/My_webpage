class AddPicture4ToProjectsabout < ActiveRecord::Migration
  def change
    add_column :projectsabouts, :picture4, :string
  end
end
