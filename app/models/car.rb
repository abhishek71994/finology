class Car < ApplicationRecord
  validates :car_type, presence: true
end
