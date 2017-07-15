class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :offers

  after_create :send_admin_mail

  
def send_admin_mail
  UserMailer.send_welcome_email(self).deliver
end

end
