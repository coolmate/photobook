class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :page
      t.text :content
      t.timestamps
    end
  end
end
