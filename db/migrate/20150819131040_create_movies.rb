class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.integer :duration
    end
  end
end
