class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name, unique: true
    end
  end
end
