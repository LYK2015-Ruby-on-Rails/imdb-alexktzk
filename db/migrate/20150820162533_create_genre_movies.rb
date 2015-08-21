class CreateGenreMovies < ActiveRecord::Migration
  def change
    create_table :genre_movies do |t|
      t.belongs_to :genre
      t.belongs_to :movie
    end
  end
end
