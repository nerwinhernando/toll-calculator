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

# Create Cities
cities_data = [
  'Manila', 'Caloocan', 'Quezon City', 'Balintawak', 'Angeles',
  'San Fernando', 'Tarlac City', 'Rosario', 'Alabang', 'Calamba'
]

cities_data.each do |name|
  City.create!(name: name)
end

# Create Routes with toll fees
routes_data = [
  { expressway: 'NLEX', origin: 'Balintawak', destination: 'Angeles', toll_fee: 219 },
  { expressway: 'SLEX', origin: 'Alabang', destination: 'Calamba', toll_fee: 164 },
  { expressway: 'TPLEX', origin: 'Tarlac City', destination: 'Rosario', toll_fee: 332 },
  { expressway: 'SCTEX', origin: 'Angeles', destination: 'Tarlac City', toll_fee: 189 },
  { expressway: 'CAVITEX', origin: 'Manila', destination: 'Rosario', toll_fee: 134 }
]

routes_data.each do |data|
  expressway = Expressway.find_by!(name: data[:expressway])
  origin = City.find_by!(name: data[:origin])
  destination = City.find_by!(name: data[:destination])

  Route.create!(
    expressway: expressway,
    origin: origin,
    destination: destination,
    toll_fee: data[:toll_fee]
  )
end
