class Delivery_charge < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '未使用に近い(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items

  end