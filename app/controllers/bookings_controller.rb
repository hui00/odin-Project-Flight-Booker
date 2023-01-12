class BookingsController < ApplicationController
  def new
    id = params[:booking][:flight_id]
    @booking = Booking.new

    @flight = Flight.find_by(id:)
    @passengers = params[:booking][:passengers].to_i.times {
      @booking.passengers.build
    }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find_by(id: @booking.flight_id)

    if @booking.save
      puts "Booking saved"
      flash[:success] = "Booking saved"
      redirect_to show_path(@booking)
    else
      if @booking.errors.any?
        puts @booking.errors.full_messages
      end
      flash[:danger] = "Booking not saved"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
