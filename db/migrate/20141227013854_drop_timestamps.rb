class DropTimestamps < ActiveRecord::Migration
  def change
    remove_column :albums, :created_at
    remove_column :pages, :created_at
    remove_column :photos, :created_at
    remove_column :quotes, :created_at
    remove_column :albums, :updated_at
    remove_column :pages, :updated_at
    remove_column :photos, :updated_at
    remove_column :quotes, :updated_at
  end
end
