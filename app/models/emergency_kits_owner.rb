class EmergencyKitsOwner < ApplicationRecord
  belongs_to :user
  
  enum gender: { male: 0, female: 1, unknown: nil }
  
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
end
  