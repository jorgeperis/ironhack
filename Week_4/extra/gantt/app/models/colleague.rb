class Colleague < ApplicationRecord
  has_many :tasks
  belongs_to :project
end
