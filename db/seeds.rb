# Create Expressways
expressways_data = [
  { name: 'NLEX', description: 'North Luzon Expressway' },
  { name: 'SLEX', description: 'South Luzon Expressway' },
  { name: 'TPLEX', description: 'Tarlac–Pangasinan–La Union Expressway' },
  { name: 'SCTEX', description: 'Subic–Clark–Tarlac Expressway' },
  { name: 'CAVITEX', description: 'Manila–Cavite Expressway' }
]

expressways_data.each do |data|
  Expressway.create!(data)
end

# Create Cities/Entry-Exit Points for NLEX-SCTEX-TPLEX
cities_data = [
  # NLEX Entry/Exit Points
  'Balintawak', 'Mindanao Avenue', 'Karuhatan', 'Valenzuela',
  'Meycauayan', 'Marilao', 'Bocaue', 'Tambubong', 'Balagtas', 'Tabang', 'Santa Rita',
  'Pulilan', 'San Simon', 'San Fernando', 'Mexico', 'Angeles', 'Dau', 'Sta. Ines',
  'Mabalacat(Mabiga)', 'Dolores', 'Concepcion', 'San Miguel', 'Tarlac City',
  # SCTEX Entry/Exit Points
  'Tipo', 'Subic', 'Dinalupihan', 'Floridablanca', 'Porac', 'Clark South',
  'Clark North', 'Mabalacat', 'Bamban', 'Tarlac City'
]

cities_data.each do |name|
  City.create!(name: name)
end

# NLEX Toll Rates - Class 1 Vehicles (Based on official matrix)
nlex = Expressway.find_by!(name: 'NLEX')

nlex_rates = [
  # Balintawak entry point rates
  { origin: 'Balintawak', destination: 'Mindanao Avenue', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Karuhatan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Valenzuela', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Meycauayan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Marilao', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Floridablanca', toll_fee: 429, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Mabalacat(Mabiga)', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Concepcion', toll_fee: 219, vehicle_class: 1 },
  # Mindanao Avenue entry point rates
  { origin: 'Mindanao Avenue', destination: 'Karuhatan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Valenzuela', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Meycauayan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Marilao', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Mindanao Avenue', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Karuhatan entry point rates
  { origin: 'Karuhatan', destination: 'Valenzuela', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Meycauayan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Marilao', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Karuhatan', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Valenzuela entry point rates
  { origin: 'Valenzuela', destination: 'Meycauayan', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Marilao', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Valenzuela', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Meycauayan entry point rates
  { origin: 'Meycauayan', destination: 'Marilao', toll_fee: 74, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Meycauayan', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Marilao entry point rates
  { origin: 'Marilao', destination: 'Ciudad de Victoria', toll_fee: 83, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Marilao', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Add more origin-destination pairs as needed
]

# SCTEX Toll Rates - Class 1 Vehicles
sctex = Expressway.find_by!(name: 'SCTEX')

sctex_rates = [
  { origin: 'Tipo', destination: 'Subic', toll_fee: 57, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Dinalupihan', toll_fee: 106, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Floridablanca', toll_fee: 182, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Porac', toll_fee: 206, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Clark South', toll_fee: 225, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Clark North', toll_fee: 236, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Mabalacat', toll_fee: 248, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Bamban', toll_fee: 268, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Tarlac City', toll_fee: 291, vehicle_class: 1 },
  # Add more SCTEX rates as needed
]

# Create all routes
def create_bidirectional_route(expressway, data)
  origin = City.find_by!(name: data[:origin])
  destination = City.find_by!(name: data[:destination])

  # Create route from origin to destination
  Route.create!(
    expressway: expressway,
    origin: origin,
    destination: destination,
    toll_fee: data[:toll_fee],
    vehicle_class: data[:vehicle_class]
  )

  # Create reverse route (destination to origin) with same toll fee
  Route.create!(
    expressway: expressway,
    origin: destination,
    destination: origin,
    toll_fee: data[:toll_fee],
    vehicle_class: data[:vehicle_class]
  )
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating route: #{e.message}"
end

# Create routes for both expressways
nlex_rates.each { |rate| create_bidirectional_route(nlex, rate) }
sctex_rates.each { |rate| create_bidirectional_route(sctex, rate) }

# Create Class 2 and 3 rates based on multipliers
def create_other_vehicle_classes(expressway, rates)
  rates.each do |rate|
    # Class 2 (x2.5 of Class 1)
    create_bidirectional_route(expressway, {
      origin: rate[:origin],
      destination: rate[:destination],
      toll_fee: (rate[:toll_fee] * 2.5).round,
      vehicle_class: 2
    })

    # Class 3 (x3 of Class 1)
    create_bidirectional_route(expressway, {
      origin: rate[:origin],
      destination: rate[:destination],
      toll_fee: (rate[:toll_fee] * 3).round,
      vehicle_class: 3
    })
  end
end

create_other_vehicle_classes(nlex, nlex_rates)
create_other_vehicle_classes(sctex, sctex_rates)
