class Product < ApplicationRecord
  belongs_to :user
  has_many :bid
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
end
