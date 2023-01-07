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
  {name: "Charles de Gaulle Airport", code: "CDG", city: "Paris"},
  {name: "Frankfurt Airport", code: "FRA", city: "Frankfurt"},
  {name: "London Heathrow Airport", code: "LHR", city: "London"},
  {name: "Madrid Barajas Airport", code: "MAD", city: "Madrid"},
  {name: "New York JFK Airport", code: "JFK", city: "New York"},
  {name: "Paris Charles de Gaulle Airport", code: "CDG", city: "Paris"},
  {name: "Paris Orly Airport", code: "ORY", city: "Paris"},
  {name: "Rome Fiumicino Airport", code: "FCO", city: "Rome"},
  {name: "San Francisco Airport", code: "SFO", city: "San Francisco"},
  {name: "Tokyo Haneda Airport", code: "HND", city: "Tokyo"},
  {name: "Tokyo Narita Airport", code: "NRT", city: "Tokyo"},
  {name: "Washington Dulles Airport", code: "IAD", city: "Washington"}
]

airpots.each { |airport| Airport.create(airportcode: airport[:code]) }

1000.times do
  arrival_airport_id = Airport.all.sample.id
  departure_airport_id = arrival_airport_id

  while departure_airport_id == arrival_airport_id
    departure_airport_id = Airport.all.sample.id
  end

  Flight.create(
    start_datetime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 350),
    duration: Faker::Number.between(from: 2, to: 12),
    arrival_airport_id: arrival_airport_id,
    departure_airport_id: departure_airport_id
  )
end
