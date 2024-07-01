# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :user
  # belongs_to :history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  validates :name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than_or_equal_to: 9_999_999, message: "must be between 300 and 9999999" }
end
