class Item < ApplicationRecord

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :condition_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1 }, presence: true
  validates :shipment_days_id, numericality: { other_than: 1 }, presence: true
  validates :shipment_source_id, numericality: { other_than: 1 }, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipment_days
  belongs_to :shipment_source

end
