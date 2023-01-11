class BookingsController < ApplicationController
  def new
    id = params[:booking][:flight_id]
    @booking = Booking.new(flight_id: id)

    # @flight = Flight.find_by(id:)

    # @passengers_amount = params[:booking][:passengers].to_i
    # @passengers = Array.new(@passengers_amount) { Passenger.new }
    @passengers = params[:booking][:passengers].to_i.times {
      @booking.passengers.build
    }
    # @booking.passengers.build
  end

  def create
    # passengers_name = params[:booking][:name]
    # passengers_email = params[:booking][:email]
    # newPassenger = Passenger.create(name: passengers_name, email: passengers_email)
    # @passengers = [name: passengers_name, email: passengers_email]
    # @flight = Flight.find_by(id: params[:booking][:flight_id])
    # @booking = Booking.new(@passengers, @flight)

    if @booking.save
      # @booking.passengers.each do |passenger|
      #   PassengerMailer.with(passenger: passenger).thank_you_email.deliver_now
      # end
      redirect_to @booking
    else
      render "new"
    end
  end
end
