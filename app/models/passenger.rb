# == Schema Information
#
# Table name: passengers
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_and_belongs_to_many :bookings
end
