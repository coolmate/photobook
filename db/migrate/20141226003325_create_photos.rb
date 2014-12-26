class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :page
      t.string :url
      t.timestamps
    end
  end
end
