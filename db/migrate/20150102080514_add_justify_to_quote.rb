class AddJustifyToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :justify, :string
  end
end
