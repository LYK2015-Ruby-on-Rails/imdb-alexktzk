class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.string :title, unique: true
    end
  end
end
