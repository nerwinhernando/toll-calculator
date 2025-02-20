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
  'Balintawak', 'Mindanao Avenue', 'Karuhatan', 'Valenzuela', 'Lawang Bato',
  'Meycauayan', 'Marilao', 'Bocaue', 'Tambubong', 'Tabang', 'Santa Rita',
  'Pulilan', 'San Simon', 'San Fernando', 'Mexico', 'Angeles', 'Dau',
  'Concepcion', 'Tarlac',
  # SCTEX Entry/Exit Points
  'Tipo', 'Subic', 'Dinalupihan', 'Floridablanca', 'Porac', 'Clark South',
  'Clark North', 'Mabalacat', 'Bamban', 'Tarlac'
]

cities_data.each do |name|
  City.create!(name: name)
end

# NLEX Toll Rates - Class 1 Vehicles (Based on official matrix)
nlex = Expressway.find_by!(name: 'NLEX')

nlex_rates = [
  # Balintawak entry point rates
  { origin: 'Balintawak', destination: 'Mindanao Avenue', toll_fee: 45, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Karuhatan', toll_fee: 45, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Valenzuela', toll_fee: 45, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Lawang Bato', toll_fee: 45, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Meycauayan', toll_fee: 55, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Marilao', toll_fee: 65, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Bocaue', toll_fee: 75, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Tabang', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Santa Rita', toll_fee: 107, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Pulilan', toll_fee: 117, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'San Simon', toll_fee: 137, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'San Fernando', toll_fee: 147, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Mexico', toll_fee: 167, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Angeles', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Dau', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Balintawak', destination: 'Concepcion', toll_fee: 219, vehicle_class: 1 },
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
  { origin: 'Tipo', destination: 'Tarlac', toll_fee: 291, vehicle_class: 1 },
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
