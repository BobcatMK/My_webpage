class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :mains, :title, :name
    rename_column :mains, :body, :content
  end
end
