class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :omniauth_providers => [:facebook, :twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = user.provider == "twitter" ? auth.info.nickname : auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end


  has_attached_file :avatar,
                    :styles => { :comments_avatar => "50x50>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/
  ratyrate_rater

  has_many :comments
end
