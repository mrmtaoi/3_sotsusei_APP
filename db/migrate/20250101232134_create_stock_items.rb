class CreateStockItems < ActiveRecord::Migration[7.0]
  def change
    belongs_to :stock
    belongs_to :item
    has_many :reminders, dependent: :destroy

    create_table :stock_items do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.string :storage
      t.timestamps
    end
  end
end
