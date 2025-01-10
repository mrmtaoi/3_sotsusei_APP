class Reminder < ApplicationRecord
  belongs_to :kit_item
  belongs_to :stock_item
  belongs_to :emergency_kit
  
# interval_months をバリデート
  validates :interval_months, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
  