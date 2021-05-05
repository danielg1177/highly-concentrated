class Ganja < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :purchase_requests

  validates :name, presence: true
  validates :strain, presence: true
  validates :unit_price, presence: true
  validates :pickup_local, presence: true
  validates :variety, inclusion: { in: %w[edible flower] }

  geocoded_by :pickup_local
  after_validation :geocode, if: :will_save_change_to_pickup_local?

end
