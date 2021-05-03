class Ganja < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :purchase_requests

  validates :name, presence: true
  validates :strain, presence: true
  validates :unit_price, presence: true
  validates :pickup_local, presence: true
  validates :variety, inclusion: { in: %w[edible flower] }
end
