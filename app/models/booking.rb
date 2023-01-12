# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not nulls
#  flight_id  :bigint           not null
#
# Indexes
#
#  index_bookings_on_flight_id  (flight_id)
#
# Foreign Keys
#
#  fk_rails_...  (flight_id => flights.id)
#
class Booking < ApplicationRecord
  belongs_to :flight, required: true
  has_and_belongs_to_many :passengers, required: true

  accepts_nested_attributes_for :passengers, allow_destroy: true
end
