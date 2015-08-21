class Cast < ActiveRecord::Base
  serialize :full_name
  attr_reader :first_name, :second_name, :last_name

  has_attached_file :avatar,
                    :styles => { :poster_size => "300x200>", :mini => "100x100" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/

  has_many :contracts
  has_many :movies, through: :contracts
  has_many :occupations, through: :contracts
end
