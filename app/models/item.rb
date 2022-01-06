class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipment_days
  belongs_to :shipment_source

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :category_id, numericality: { other_than: 1, message: 'can‘t be blank' }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: 'can‘t be blank' }, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1, message: 'can‘t be blank' }, presence: true
  validates :shipment_source_id, numericality: { other_than: 1, message: 'can‘t be blank' }, presence: true
  validates :shipment_days_id, numericality: { other_than: 1, message: 'can‘t be blank' }, presence: true
end
