class Trip < ApplicationRecord
  belongs_to :owned_by, class_name: 'User', foreign_key: 'owned_by_id'

  validates :title, :date, :duration,  presence: true

end
