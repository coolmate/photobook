class DisallowNilFields < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :albums, :name, :string, null: false
    change_column :pages, :layout, :integer, null: false
  end
end
