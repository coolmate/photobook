class AddOffsetsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :offset_left, :integer, default: 0
    add_column :photos, :offset_top, :integer, default: 0
  end
end
