class Product < ApplicationRecord
  belongs_to :user
  belongs_to :history
  has_one_attached :image


  validates :name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, presence: true
end
