class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :lists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :offers
  has_many :income_taxes, dependent: :destroy

  after_create :send_admin_mail

  
def send_admin_mail
  UserMailer.send_welcome_email(self).deliver
end

def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
end

end
