class RemoveItemIdFromStockItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :stock_items, :item_id, :integer
  end
end
