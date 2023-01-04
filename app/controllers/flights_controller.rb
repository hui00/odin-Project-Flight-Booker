class FlightsController < ApplicationController
  def index
    @flights = []
  end

  def search
    # origin = params[:search][:origin]
    # destination = params[:search][:destination]
    # date = params[:search][:date]
    # @flights = Flight.joins(:departure_airport).where(departure_airport: origin)

    origin_id = params[:search][:origin]
    destination_id = params[:search][:destination]
    @flights = Flight.where(departure_airport_id: origin_id, arrival_airport_id: destination_id)

    if @flights.empty?
      flash.now[:danger] = "No flights found"
    else
      flash.now[:success] = "Flights found"
    end

    render :index
  end

  private

  def group_dates_by_month(dates)
    dates.group_by { |d| d.strftime("%B %Y") }.map { |month_year, month_dates| [month_year, month_dates.map { |d| d.strftime("%Y-%m") }] }
  end
end
