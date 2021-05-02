class PurchaseRequest < ApplicationRecord
  belongs_to :user
  belongs_to :ganja

  validates :pickup_time, presence: true
  validates :status, inclusion: { in: %w[Accepted accepted
                                         Pending pending
                                         Declined declined] }
end
