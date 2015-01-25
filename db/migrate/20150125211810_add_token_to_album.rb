class AddTokenToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :token, :string
    add_index :albums, :token, unique: true
  end
end
