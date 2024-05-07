class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  
  has_many :attendances
  belongs_to :user


  #validates :start_date,
   #presence: true

  validates :duration,
   presence: true,
   numericality: { :greater_than_or_equal_to => 0 }
   

  validates :title,
   presence: true,
   length: { in: 5..140 }

  

  #validates :description,
   #presence: true,
   #length: {in: 20..1000}

  validates :location,
   presence: true

  validates_inclusion_of :price,
   :in => 1..1000

  validates :price,
   presence: true

  
  def divisible_by_five
   if (self.duration % 5) != 0
      self.errors[:base] << "Number must be divisible by 5!"
    end
  end
  validate :divisible_by_five
  
 # def start_date_cannot_be_in_the_past
  #  errors.add(:start_date, 'cannot be in the past') if start_date < Time.zone.today
  #end
end
