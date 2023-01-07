class FlightsController < ApplicationController
  def index
    @flights = []
  end

  def search
    origin_id = params[:search][:origin]
    destination_id = params[:search][:destination]
    @flights = Flight.where(departure_airport_id: origin_id, arrival_airport_id: destination_id)

    month = params[:search][:month]
    if month.present?
      month_number = Date::MONTHNAMES.index(month)
      @flights = @flights.where("EXTRACT(MONTH FROM start_datetime) = ?", month_number)
    end


    if @flights.empty?
      flash.now[:danger] = "No flights found"
    else
      flash.now[:success] = "Flights found"
    end

    render :index
  end

  def new
    puts params
  end
end
