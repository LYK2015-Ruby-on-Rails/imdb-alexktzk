class Movie < ActiveRecord::Base

  has_many :contracts
  has_many :occupations, through: :contracts
  has_many :casts, through: :contracts

  def sign_contracts(occupation_ids)
    occupation_ids.each_with_index do |occupation|
      occupation[1].reject(&:empty?).each do |cast|
        Contract.create(cast_id: cast.to_i, occupation_id: occupation[0].to_i, movie_id: self.id)
      end
    end
  end

end
