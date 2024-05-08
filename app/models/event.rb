class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  
  has_many :attendances
  belongs_to :user

   validates :title, presence: true, length: { minimum: 3, maximum: 50 }
   validates :description, presence: true, length: { minimum: 10, maximum: 500 }
   validates :date, presence: true
   validates :location, presence: true
   validate :divisible_by_five
 
   def divisible_by_five
     if duration.present? && (duration % 5) != 0
       errors.add(:duration, "must be divisible by 5")
     end
   end
  
 # def start_date_cannot_be_in_the_past
  #  errors.add(:start_date, 'cannot be in the past') if start_date < Time.zone.today
  #end
end
