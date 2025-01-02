class KitItem < ApplicationRecord
  belongs_to :emergency_kit
  belongs_to :item
end
  