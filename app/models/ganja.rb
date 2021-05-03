class Ganja < ApplicationRecord
  belongs_to :user



  validates :name, presence: true
  validates :strain, presence: true
  validates :unit_price, presence: true
  validates :pickup_local, presence: true
  validates :variety, inclusion: { in: %w[edible flower] }
end
