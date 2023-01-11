# == Schema Information
#
# Table name: bookings_passengers
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  booking_id   :bigint           not null
#  passenger_id :bigint           not null
#
# Indexes
#
#  index_bookings_passengers_on_booking_id    (booking_id)
#  index_bookings_passengers_on_passenger_id  (passenger_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#  fk_rails_...  (passenger_id => passengers.id)
#
require "test_helper"

class BookingsPassengerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
