class Route < ApplicationRecord
  belongs_to :expressway
  belongs_to :origin, class_name: 'City'
  belongs_to :destination, class_name: 'City'

  validates :toll_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :vehicle_class, presence: true, inclusion: { in: [1, 2, 3] }
  validates :expressway_id, uniqueness: { scope: [:origin_id, :destination_id, :vehicle_class] }
end
