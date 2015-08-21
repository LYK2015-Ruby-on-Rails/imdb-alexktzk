class AddPosterToMovies < ActiveRecord::Migration
  def up
    add_attachment :movies, :poster
  end

  def down
    remove_attachment :movies, :poster
  end
end
