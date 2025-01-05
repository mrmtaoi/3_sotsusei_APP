class AddStockItemNameToStockItems < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_items, :stock_item_name, :string
  end
end
