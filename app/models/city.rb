class City < ApplicationRecord
  has_many :origin_routes, class_name: 'Route', foreign_key: 'origin_id'
  has_many :destination_routes, class_name: 'Route', foreign_key: 'destination_id'
  # validates :name, presence: true, uniqueness: true
end
