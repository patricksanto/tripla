class Trip < ApplicationRecord
  belongs_to :owned_by, class_name: 'User', foreign_key: 'owned_by_id'
  has_many :trip_days, dependent: :destroy

  validates :title, :date, :duration,  presence: true

  after_create :create_trip_days

  private

  def create_trip_days
    duration.times do |i|
      trip_days.create!(day: i + 1, date: date + i.days, trip: self)
    end
  end
end
