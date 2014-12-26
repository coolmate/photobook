class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :album
      t.integer :layout
      t.timestamps
    end
  end
end
