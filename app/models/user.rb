class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable,
         :recoverable,
         :trackable


  has_attached_file :avatar,
                    :styles => { :comments_avatar => "50x50>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/
  ratyrate_rater

  has_many :comments
end
