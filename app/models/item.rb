class Item < ApplicationRecord
  has_many :kit_items, dependent: :destroy
  
  validates :name, presence: true
end
  