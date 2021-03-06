require 'elasticsearch/model'

class Movie < ActiveRecord::Base
  include Elasticsearch::Model

  has_many :contracts
  has_many :occupations, through: :contracts
  has_many :casts, through: :contracts
  has_many :genre_movies
  has_many :genres, through: :genre_movies

  has_attached_file :poster,
                    :styles => { :poster_size => "140x200>", :mini => "100x100" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :poster,
                                    :content_type => /\Aimage\/.*\Z/

  ratyrate_rateable 'title'

  acts_as_commentable

  def sign_contracts(occupation_ids)
    occupation_ids.each_with_index do |occupation|
      occupation[1].reject(&:empty?).each do |cast|
        Contract.create(cast_id: cast.to_i, occupation_id: occupation[0].to_i, movie_id: self.id)
      end
    end
  end

  def save_genres(genre_ids)
    genre_ids.each do |id|
      GenreMovie.create(genre_id: id.to_i, movie_id: self.id)
    end
  end

  def update_genres(genre_ids)
    genre_ids.each do |id|
      # self.update(genre_id: id.to_i)
    end
  end
end
