class Product < ApplicationRecord
  belongs_to :user
  has_many :bid
  has_many :reviews
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
end
