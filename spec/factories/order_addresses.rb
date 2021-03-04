FactoryBot.define do
  factory :order_address do
    zip { '111-1111' }
    region_id { 3 }
    city { '世田谷区' }
    address { '青山1-1-1' }
    building { '柳ビル203' }
    phone { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
