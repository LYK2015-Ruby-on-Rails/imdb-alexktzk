class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.text :full_name
      t.date :born
      t.string :nationality

      t.timestamps null: false
    end
  end
end
