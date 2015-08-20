class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.belongs_to :cast
      t.belongs_to :occupation
      t.belongs_to :movie

      t.timestamps null: false
    end
  end
end
