class AddShapeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :shape, :string
  end
end
