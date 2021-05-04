class PurchaseRequest < ApplicationRecord
  belongs_to :user
  belongs_to :ganja

  validates :status, inclusion: { in: %w[accepted pending declined] }
end
