class AddBiographyToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :biography, :text
  end
end
