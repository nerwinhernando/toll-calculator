class Expressway < ApplicationRecord
  has_many :routes
  validates :name, presence: true, uniqueness: true
end
