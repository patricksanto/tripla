class TripDay < ApplicationRecord
  belongs_to :trip
  has_many :activities, dependent: :destroy

  validates :day, presence: true
  validates :date, presence: true
end
