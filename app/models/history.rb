class History < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :order
end