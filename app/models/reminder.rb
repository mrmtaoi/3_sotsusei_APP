class Reminder < ApplicationRecord
  belongs_to :emergency_kit
  belongs_to :stock_item
  
# interval_months をバリデート
  validates :interval_months, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
  