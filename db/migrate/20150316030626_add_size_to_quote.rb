class AddSizeToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :size, :integer
  end
end
