class User < ApplicationRecord
  has_many :product
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
