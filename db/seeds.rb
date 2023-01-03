# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
# Charles de Gaulle Airport (CDG) to Paris Frankfurt Airport (FRA) to Frankfurt
# London Heathrow Airport (LHR) to London
# Madrid Barajas Airport (MAD) to Madrid
# New York JFK Airport (JFK) to New York
# Paris Charles de Gaulle Airport (CDG) to Paris
# Paris Orly Airport (ORY) to Paris
# Rome Fiumicino Airport (FCO) to Rome
# San Francisco Airport (SFO) to San Francisco
# Tokyo Haneda Airport (HND) to Tokyo
# Tokyo Narita Airport (NRT) to Tokyo
# Washington Dulles Airport (IAD) to Washington

airpots = [
  { name: "Charles de Gaulle Airport", code: "CDG", city: "Paris" },
  { name: "Frankfurt Airport", code: "FRA", city: "Frankfurt" },
  { name: "London Heathrow Airport", code: "LHR", city: "London" },
  { name: "Madrid Barajas Airport", code: "MAD", city: "Madrid" },
  { name: "New York JFK Airport", code: "JFK", city: "New York" },
  { name: "Paris Charles de Gaulle Airport", code: "CDG", city: "Paris" },
  { name: "Paris Orly Airport", code: "ORY", city: "Paris" },
  { name: "Rome Fiumicino Airport", code: "FCO", city: "Rome" },
  { name: "San Francisco Airport", code: "SFO", city: "San Francisco" },
  { name: "Tokyo Haneda Airport", code: "HND", city: "Tokyo" },
  { name: "Tokyo Narita Airport", code: "NRT", city: "Tokyo" },
  { name: "Washington Dulles Airport", code: "IAD", city: "Washington" }
]

airpots.each { |airport| Airport.create(airportcode: airport[:code]) }

10.times do
  arrival_airport_id = Airport.all.sample.id
  departure_airport_id = arrival_airport_id

  while departure_airport_id == arrival_airport_id
    departure_airport_id = Airport.all.sample.id
  end

  Flight.create(
    start_datetime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 40),
    duration: Faker::Number.between(from: 2, to: 12),
    arrival_airport_id: arrival_airport_id,
    departure_airport_id: departure_airport_id
  )
end

