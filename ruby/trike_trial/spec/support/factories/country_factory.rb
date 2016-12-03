FactoryGirl.define do

  factory :country do
    name                  { Faker::Address.country }
    code                  { Faker::Address.country_code() }
    regular_shipping_rate { (rand(100) + 10).to_s }
    express_shipping_rate { (rand(100) + 10).to_s }
  end

  factory :invalid_country, parent: :country do
    name                  nil
    code                  nil
    regular_shipping_rate nil
    express_shipping_rate nil
  end

end
