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
require "test_helper"

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
