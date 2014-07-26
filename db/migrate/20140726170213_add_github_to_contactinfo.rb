class AddGithubToContactinfo < ActiveRecord::Migration
  def change
    add_column :contactinfos, :github, :string
  end
end
