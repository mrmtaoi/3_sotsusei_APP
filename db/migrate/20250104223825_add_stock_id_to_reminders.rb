class AddStockIdToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :stock_id, :integer
  end
end
