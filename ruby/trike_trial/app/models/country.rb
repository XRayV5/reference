class Country < ActiveRecord::Base

  validates_presence_of :name , :code, :regular_shipping_rate, :express_shipping_rate

  def self.find_by_code country_code
    self.where(code: country_code)
  end

  def self.insert new_country
    this_country = self.new
    this_country.name = new_country[:name]
    this_country.code = new_country[:code]
    this_country.regular_shipping_rate = new_country[:regular_shipping_rate]
    this_country.express_shipping_rate = new_country[:express_shipping_rate]
    this_country.save
    this_country
  end

end
