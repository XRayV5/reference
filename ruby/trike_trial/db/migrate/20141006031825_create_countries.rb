class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.string :regular_shipping_rate
      t.string :express_shipping_rate
      t.timestamps
    end
  end
end
