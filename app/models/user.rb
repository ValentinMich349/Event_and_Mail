class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :attendances
    has_many :events, through: :attendances
    has_many :administered_events, class_name: "Event", foreign_key: "admin_id"
    after_create :send_welcome_email

    private
  
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end
  end