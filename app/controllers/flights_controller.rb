class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end
end

 private

def group_dates_by_month(dates)
  dates.group_by { |d| d.strftime("%B %Y") }.map { |month_year, month_dates| [month_year, month_dates.map { |d| d.strftime("%Y-%m") }] }
end
