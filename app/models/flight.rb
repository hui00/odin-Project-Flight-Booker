# == Schema Information
#
# Table name: flights
#
#  id                   :bigint           not null, primary key
#  duration             :integer
#  start_datetime       :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  arrival_airport_id   :integer
#  departure_airport_id :integer
#
class Flight < ApplicationRecord
  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
end
