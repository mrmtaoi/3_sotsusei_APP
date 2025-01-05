class User < ApplicationRecord
  has_many :stocks
  has_many :emergency_kits
  has_many :emergency_kits_owners
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
