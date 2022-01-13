FactoryBot.define do
  factory :order_address do
    zipcode { '123-4567' }
    shipment_source_id { 14 }
    address1 { '荒川区' }
    address2 { '東尾久' }
    building_name { 'AK4801' }
    phone_number { '05012345678' }
    token { 1 }
  end
end
