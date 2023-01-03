# == Schema Information
#
# Table name: airports
#
#  id          :bigint           not null, primary key
#  airportcode :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Airport < ApplicationRecord
  validates :airportcode, presence: true, uniqueness: true
  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id"
end
