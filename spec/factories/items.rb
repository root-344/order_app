FactoryBot.define do
  factory :item do
    product { 'あa1ai33' }
    description { 'test' }
    states { 'test' }
    shipping_fee_id { 2 }
    region_id { 2 }
    eta_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
