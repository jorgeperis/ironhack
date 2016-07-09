class Concert < ApplicationRecord
  validates :artist, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :venue, presence: true
  validates :city, presence: true
  has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
