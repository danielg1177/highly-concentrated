class PurchaseRequest < ApplicationRecord
  belongs_to :user
  belongs_to :ganja
end
