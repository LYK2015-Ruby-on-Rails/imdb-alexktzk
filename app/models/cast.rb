class Cast < ActiveRecord::Base
  serialize :full_name
  attr_reader :first_name, :second_name, :last_name

  has_many :contracts
  has_many :movies, through: :contracts
  has_many :occupations, through: :contracts
end
