# NLEX SCTEX: https://trb.gov.ph/index.php/toll-rates/nlex-toll-rate
# TPLEX: https://trb.gov.ph/index.php/toll-rates/tplex-toll-rate
# CAVITEX: https://trb.gov.ph/index.php/toll-rates/cavitex-toll-rate
# SLEX: https://trb.gov.ph/index.php/toll-rates/slex-toll-rate
# SCTEX: https://trb.gov.ph/index.php/toll-rates/sctex-toll-rate
# NAIAX: https://trb.gov.ph/index.php/toll-rates/naiax-expressway
# CALAX: https://trb.gov.ph/index.php/toll-rates/calax-toll-rate
# STAR: https://trb.gov.ph/index.php/toll-rates/star-toll-rate
# MCX: https://trb.gov.ph/index.php/toll-rates/mcx-toll-rate
# C5 Link: https://trb.gov.ph/index.php/toll-rates/c5-link-toll-rate
# CAVITEX C5 Link: https://trb.gov.ph/index.php/toll-rates/cavitex-c5-link-toll-rate
# CAVITEX C5 South Link Expressway: https://trb.gov.ph/index.php/toll-rates/cavitex-c5-south-link-expressway
# CALAX Laguna Segment: https://trb.gov.ph/index.php/toll-rates/calax-laguna-segment
# CALAX Cavite Segment: https://trb.gov.ph/index.php/toll-rates/calax-cavite-segment
# SKYWAY STAGE 3: https://trb.gov.ph/index.php/toll-rates/metro-manila-skyway-stage-3
# CCLEX: https://trb.gov.ph/index.php/toll-rates/cclex-toll-rate

# Create Expressways
expressways_data = [
  { name: 'NLEX', description: 'North Luzon Expressway' },
  { name: 'SLEX', description: 'South Luzon Expressway' },
  { name: 'TPLEX', description: 'Tarlac–Pangasinan–La Union Expressway' },
  { name: 'SCTEX', description: 'Subic–Clark–Tarlac Expressway' },
  { name: 'CAVITEX', description: 'Manila–Cavite Expressway' },
  { name: 'NAIAX', description: 'Ninoy Aquino International Airport Expressway' },
  { name: 'CALAX', description: 'Cavite–Laguna Expressway' },
  { name: 'STAR', description: 'Southern Tagalog Arterial Road' },
  { name: 'MCX', description: 'Muntinlupa–Cavite Expressway' },
  { name: 'C5 Link', description: 'C5 South Link Expressway' },
  { name: 'CAVITEX C5 Link', description: 'Cavite–C5 Link Expressway' },
  { name: 'CAVITEX C5 South Link', description: 'Cavite–C5 South Link Expressway' },
  { name: 'CAVITEX C5 South Link Expressway', description: 'Cavite–C5 South Link Expressway' },
  { name: 'CALAX Laguna Segment', description: 'Cavite–Laguna Expressway Laguna Segment' },
  { name: 'CALAX Cavite Segment', description: 'Cavite–Laguna Expressway Cavite Segment' },
  { name: 'SKYWAY STAGE 3', description: 'Metro Manila Skyway Stage 3' },
  { name: 'CCLEX', description: 'Cebu–Cordova Link Expressway' },
]

expressways_data.each do |data|
  Expressway.create!(data)
end

# Create Cities/Entry-Exit Points for NLEX-SCTEX-TPLEX
cities_data = [
  # NLEX Entry/Exit Points
  'Balintawak', 'Mindanao Avenue', 'Karuhatan', 'Valenzuela',
  'Meycauayan', 'Marilao', 'Ciudad de Victoria', 'Bocaue', 'Tambubong', 'Balagtas', 'Tabang', 'Santa Rita',
  'Pulilan', 'San Simon', 'San Fernando', 'Mexico', 'Angeles', 'Dau', 'Sta. Ines',
  'Mabalacat(Mabiga)', 'Dolores', 'Concepcion', 'San Miguel', 'Tarlac City',
  # SCTEX Entry/Exit Points
  'Tipo', 'Subic', 'Dinalupihan', 'Floridablanca', 'Porac', 'Clark South',
  'Clark North', 'Mabalacat', 'Bamban', 'Tarlac City',
  # SKYWAY STAGE 3 Entry/Exit Points
  'Buendia', 'Quirino', 'Plaza Azul', 'Nagtahan', 'Aurora Blvd', 'E. Rodriguez', 'Quezon Ave', 'Balintawak', 'NLEX',
  # CAVITEX Entry/Exit Points
  'Merville', 'Taguig', 'Roxas Blvd', 'Kawit', 'Zapote', 'C5 Road Extension/C.P.Garcia', 'Sucat Road/Dr. A Santos Avenue',
  # CALAX Entry/Exit Points
  'Mamplasan', 'Santa Rosa-Tagaytay', 'Silang', 'Sta. Rosa-Tagaytay', 'Silang', 'Sta. Rosa-Tagaytay',
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
  # Ciudad de Victoria entry point rates
  { origin: 'Ciudad de Victoria', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Tambubong', toll_fee: 95, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Balagtas', toll_fee: 116, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Tabang', toll_fee: 132, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  { origin: 'Ciudad de Victoria', destination: 'Bocaue', toll_fee: 91, vehicle_class: 1 },
  # Bocaue entry point rates
  { origin: 'Bocaue', destination: 'Tambubong', toll_fee: 4, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Balagtas', toll_fee: 25, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Tabang', toll_fee: 41, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Santa Rita', toll_fee: 47, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Pulilan', toll_fee: 77, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'San Simon', toll_fee: 129, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'San Fernando', toll_fee: 167, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Mexico', toll_fee: 199, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Angeles', toll_fee: 236, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Dau', toll_fee: 245, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Sta. Ines', toll_fee: 268, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Tipo', toll_fee: 635, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Dinalupihan', toll_fee: 528, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Floridablanca', toll_fee: 418, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Porac', toll_fee: 338, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Clark South', toll_fee: 278, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Mabalacat(Mabiga)', toll_fee: 268, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Clark North', toll_fee: 292, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Dolores', toll_fee: 301, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Concepcion', toll_fee: 362, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'San Miguel', toll_fee: 444, vehicle_class: 1 },
  { origin: 'Bocaue', destination: 'Tarlac City', toll_fee: 473, vehicle_class: 1 },
  # Tambubong entry point rates
  { origin: 'Tambubong', destination: 'Balagtas', toll_fee: 21, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Tabang', toll_fee: 37, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Santa Rita', toll_fee: 43, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Pulilan', toll_fee: 73, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'San Simon', toll_fee: 125, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'San Fernando', toll_fee: 164, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Mexico', toll_fee: 195, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Angeles', toll_fee: 232, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Dau', toll_fee: 241, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Sta. Ines', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Tipo', toll_fee: 631, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Dinalupihan', toll_fee: 524, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Floridablanca', toll_fee: 414, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Porac', toll_fee: 334, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Clark South', toll_fee: 274, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Mabalacat(Mabiga)', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Clark North', toll_fee: 288, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Dolores', toll_fee: 297, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Concepcion', toll_fee: 358, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'San Miguel', toll_fee: 440, vehicle_class: 1 },
  { origin: 'Tambubong', destination: 'Tarlac City', toll_fee: 469, vehicle_class: 1 },
  # Balagtas entry point rates
  { origin: 'Balagtas', destination: 'Tabang', toll_fee: 17, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Santa Rita', toll_fee: 23, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Pulilan', toll_fee: 53, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'San Simon', toll_fee: 104, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'San Fernando', toll_fee: 143, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Mexico', toll_fee: 174, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Angeles', toll_fee: 211, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Dau', toll_fee: 220, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Sta. Ines', toll_fee: 243, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Tipo', toll_fee: 610, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Dinalupihan', toll_fee: 503, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Floridablanca', toll_fee: 393, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Porac', toll_fee: 313, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Clark South', toll_fee: 253, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Mabalacat(Mabiga)', toll_fee: 243, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Clark North', toll_fee: 267, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Dolores', toll_fee: 276, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Concepcion', toll_fee: 337, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'San Miguel', toll_fee: 419, vehicle_class: 1 },
  { origin: 'Balagtas', destination: 'Tarlac City', toll_fee: 448, vehicle_class: 1 },
  # Tabang entry point rates
  { origin: 'Tabang', destination: 'Santa Rita', toll_fee: 138, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Pulilan', toll_fee: 168, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'San Simon', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'San Fernando', toll_fee: 258, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Mexico', toll_fee: 289, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Angeles', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Dau', toll_fee: 335, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Sta. Ines', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Tipo', toll_fee: 726, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Dinalupihan', toll_fee: 619, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Floridablanca', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Porac', toll_fee: 509, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Clark South', toll_fee: 369, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Mabalacat(Mabiga)', toll_fee: 359, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Clark North', toll_fee: 383, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Dolores', toll_fee: 392, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Concepcion', toll_fee: 453, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'San Miguel', toll_fee: 535, vehicle_class: 1 },
  { origin: 'Tabang', destination: 'Tarlac City', toll_fee: 564, vehicle_class: 1 },
  # Santa Rita entry point rates
  { origin: 'Santa Rita', destination: 'Pulilan', toll_fee: 30, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'San Simon', toll_fee: 81, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'San Fernando', toll_fee: 120, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Mexico', toll_fee: 151, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Angeles', toll_fee: 188, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Dau', toll_fee: 197, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Sta. Ines', toll_fee: 220, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Tipo', toll_fee: 587, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Dinalupihan', toll_fee: 480, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Floridablanca', toll_fee: 370, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Porac', toll_fee: 290, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Clark South', toll_fee: 230, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Mabalacat(Mabiga)', toll_fee: 220, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Clark North', toll_fee: 244, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Dolores', toll_fee: 253, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Concepcion', toll_fee: 314, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'San Miguel', toll_fee: 396, vehicle_class: 1 },
  { origin: 'Santa Rita', destination: 'Tarlac City', toll_fee: 425, vehicle_class: 1 },
  # Pulilan entry point rates
  { origin: 'Pulilan', destination: 'San Simon', toll_fee: 51, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'San Fernando', toll_fee: 90, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Mexico', toll_fee: 121, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Angeles', toll_fee: 158, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Dau', toll_fee: 167, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Sta. Ines', toll_fee: 190, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Tipo', toll_fee: 557, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Dinalupihan', toll_fee: 450, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Floridablanca', toll_fee: 340, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Porac', toll_fee: 260, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Clark South', toll_fee: 200, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Mabalacat(Mabiga)', toll_fee: 190, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Clark North', toll_fee: 214, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Dolores', toll_fee: 223, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Concepcion', toll_fee: 284, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'San Miguel', toll_fee: 366, vehicle_class: 1 },
  { origin: 'Pulilan', destination: 'Tarlac City', toll_fee: 395, vehicle_class: 1 },
  # San Simon entry point rates
  { origin: 'San Simon', destination: 'San Fernando', toll_fee: 39, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Mexico', toll_fee: 70, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Angeles', toll_fee: 107, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Dau', toll_fee: 116, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Sta. Ines', toll_fee: 139, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Tipo', toll_fee: 506, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Dinalupihan', toll_fee: 399, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Floridablanca', toll_fee: 289, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Porac', toll_fee: 209, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Clark South', toll_fee: 149, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Mabalacat(Mabiga)', toll_fee: 139, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Clark North', toll_fee: 163, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Dolores', toll_fee: 172, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Concepcion', toll_fee: 233, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'San Miguel', toll_fee: 315, vehicle_class: 1 },
  { origin: 'San Simon', destination: 'Tarlac City', toll_fee: 344, vehicle_class: 1 },
  # San Fernando entry point rates
  { origin: 'San Fernando', destination: 'Mexico', toll_fee: 31, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Angeles', toll_fee: 68, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Dau', toll_fee: 77, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Sta. Ines', toll_fee: 100, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Tipo', toll_fee: 467, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Dinalupihan', toll_fee: 360, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Floridablanca', toll_fee: 250, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Porac', toll_fee: 170, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Clark South', toll_fee: 110, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Mabalacat(Mabiga)', toll_fee: 100, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Clark North', toll_fee: 124, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Dolores', toll_fee: 133, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Concepcion', toll_fee: 194, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'San Miguel', toll_fee: 276, vehicle_class: 1 },
  { origin: 'San Fernando', destination: 'Tarlac City', toll_fee: 305, vehicle_class: 1 },
  # Mexico entry point rates
  { origin: 'Mexico', destination: 'Angeles', toll_fee: 37, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Dau', toll_fee: 46, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Sta. Ines', toll_fee: 69, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Tipo', toll_fee: 436, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Dinalupihan', toll_fee: 329, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Floridablanca', toll_fee: 219, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Porac', toll_fee: 139, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Clark South', toll_fee: 79, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Mabalacat(Mabiga)', toll_fee: 69, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Clark North', toll_fee: 93, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Dolores', toll_fee: 102, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Concepcion', toll_fee: 163, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'San Miguel', toll_fee: 245, vehicle_class: 1 },
  { origin: 'Mexico', destination: 'Tarlac City', toll_fee: 274, vehicle_class: 1 },
  # Angeles entry point rates
  { origin: 'Angeles', destination: 'Dau', toll_fee: 9, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Sta. Ines', toll_fee: 32, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Tipo', toll_fee: 399, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Dinalupihan', toll_fee: 292, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Floridablanca', toll_fee: 182, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Porac', toll_fee: 102, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Clark South', toll_fee: 42, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Mabalacat(Mabiga)', toll_fee: 32, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Clark North', toll_fee: 56, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Dolores', toll_fee: 65, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Concepcion', toll_fee: 126, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'San Miguel', toll_fee: 208, vehicle_class: 1 },
  { origin: 'Angeles', destination: 'Tarlac City', toll_fee: 237, vehicle_class: 1 },
  # Dau entry point rates
  { origin: 'Dau', destination: 'Sta. Ines', toll_fee: 23, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Tipo', toll_fee: 390, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Dinalupihan', toll_fee: 283, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Floridablanca', toll_fee: 173, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Porac', toll_fee: 93, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Clark South', toll_fee: 33, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Mabalacat(Mabiga)', toll_fee: 23, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Clark North', toll_fee: 47, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Dolores', toll_fee: 56, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Concepcion', toll_fee: 117, vehicle_class: 1 },
  { origin: 'Dau', destination: 'San Miguel', toll_fee: 199, vehicle_class: 1 },
  { origin: 'Dau', destination: 'Tarlac City', toll_fee: 228, vehicle_class: 1 },
  # Sta. Ines entry point rates
  { origin: 'Sta. Ines', destination: 'Tipo', toll_fee: 467, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Dinalupihan', toll_fee: 360, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Floridablanca', toll_fee: 250, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Porac', toll_fee: 170, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Clark South', toll_fee: 110, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Mabalacat(Mabiga)', toll_fee: 100, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Clark North', toll_fee: 124, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Dolores', toll_fee: 133, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Concepcion', toll_fee: 194, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'San Miguel', toll_fee: 276, vehicle_class: 1 },
  { origin: 'Sta. Ines', destination: 'Tarlac City', toll_fee: 305, vehicle_class: 1 },
  # Tipo entry point rates
  { origin: 'Tipo', destination: 'Dinalupihan', toll_fee: 107, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Floridablanca', toll_fee: 217, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Porac', toll_fee: 297, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Clark South', toll_fee: 357, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Mabalacat(Mabiga)', toll_fee: 367, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Clark North', toll_fee: 391, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Dolores', toll_fee: 400, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Concepcion', toll_fee: 461, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'San Miguel', toll_fee: 543, vehicle_class: 1 },
  { origin: 'Tipo', destination: 'Tarlac City', toll_fee: 571, vehicle_class: 1 },
  # Dinalupihan entry point rates
  { origin: 'Dinalupihan', destination: 'Floridablanca', toll_fee: 109, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Porac', toll_fee: 190, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Clark South', toll_fee: 250, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Mabalacat(Mabiga)', toll_fee: 260, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Clark North', toll_fee: 284, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Dolores', toll_fee: 293, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Concepcion', toll_fee: 353, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'San Miguel', toll_fee: 436, vehicle_class: 1 },
  { origin: 'Dinalupihan', destination: 'Tarlac City', toll_fee: 464, vehicle_class: 1 },
  # Floridablanca entry point rates
  { origin: 'Floridablanca', destination: 'Porac', toll_fee: 80, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Clark South', toll_fee: 140, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Mabalacat(Mabiga)', toll_fee: 150, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Clark North', toll_fee: 174, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Dolores', toll_fee: 183, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Concepcion', toll_fee: 244, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'San Miguel', toll_fee: 326, vehicle_class: 1 },
  { origin: 'Floridablanca', destination: 'Tarlac City', toll_fee: 355, vehicle_class: 1 },
  # Porac entry point rates
  { origin: 'Porac', destination: 'Clark South', toll_fee: 60, vehicle_class: 1 },
  { origin: 'Porac', destination: 'Mabalacat(Mabiga)', toll_fee: 70, vehicle_class: 1 },
  { origin: 'Porac', destination: 'Clark North', toll_fee: 94, vehicle_class: 1 },
  { origin: 'Porac', destination: 'Dolores', toll_fee: 103, vehicle_class: 1 },
  { origin: 'Porac', destination: 'Concepcion', toll_fee: 164, vehicle_class: 1 },
  { origin: 'Porac', destination: 'San Miguel', toll_fee: 246, vehicle_class: 1 },
  { origin: 'Porac', destination: 'Tarlac City', toll_fee: 275, vehicle_class: 1 },
  # Clark South entry point rates
  { origin: 'Clark South', destination: 'Mabalacat(Mabiga)', toll_fee: 10, vehicle_class: 1 },
  { origin: 'Clark South', destination: 'Clark North', toll_fee: 34, vehicle_class: 1 },
  { origin: 'Clark South', destination: 'Dolores', toll_fee: 43, vehicle_class: 1 },
  { origin: 'Clark South', destination: 'Concepcion', toll_fee: 104, vehicle_class: 1 },
  { origin: 'Clark South', destination: 'San Miguel', toll_fee: 186, vehicle_class: 1 },
  { origin: 'Clark South', destination: 'Tarlac City', toll_fee: 214, vehicle_class: 1 },
  # Mabalacat(Mabiga) entry point rates
  { origin: 'Mabalacat(Mabiga)', destination: 'Clark North', toll_fee: 24, vehicle_class: 1 },
  { origin: 'Mabalacat(Mabiga)', destination: 'Dolores', toll_fee: 33, vehicle_class: 1 },
  { origin: 'Mabalacat(Mabiga)', destination: 'Concepcion', toll_fee: 94, vehicle_class: 1 },
  { origin: 'Mabalacat(Mabiga)', destination: 'San Miguel', toll_fee: 176, vehicle_class: 1 },
  { origin: 'Mabalacat(Mabiga)', destination: 'Tarlac City', toll_fee: 205, vehicle_class: 1 },
  # Clark North entry point rates
  { origin: 'Clark North', destination: 'Dolores', toll_fee: 9, vehicle_class: 1 },
  { origin: 'Clark North', destination: 'Concepcion', toll_fee: 70, vehicle_class: 1 },
  { origin: 'Clark North', destination: 'San Miguel', toll_fee: 152, vehicle_class: 1 },
  { origin: 'Clark North', destination: 'Tarlac City', toll_fee: 181, vehicle_class: 1 },
  # Dolores entry point rates
  { origin: 'Dolores', destination: 'Concepcion', toll_fee: 61, vehicle_class: 1 },
  { origin: 'Dolores', destination: 'San Miguel', toll_fee: 143, vehicle_class: 1 },
  { origin: 'Dolores', destination: 'Tarlac City', toll_fee: 172, vehicle_class: 1 },
  # Concepcion entry point rates
  { origin: 'Concepcion', destination: 'San Miguel', toll_fee: 82, vehicle_class: 1 },
  { origin: 'Concepcion', destination: 'Tarlac City', toll_fee: 111, vehicle_class: 1 },
  # San Miguel entry point rates
  { origin: 'San Miguel', destination: 'Tarlac City', toll_fee: 29, vehicle_class: 1 },
]

cavitex = Expressway.find_by!(name: 'CAVITEX')
cavitex_rates = [
  { origin: 'Merville', destination: 'Taguig', toll_fee: 35, vehicle_class: 1 },
  { origin: 'Roxas Blvd', destination: 'Zapote', toll_fee: 35, vehicle_class: 1 },
  { origin: 'Roxas Blvd', destination: 'Kawit', toll_fee: 108, vehicle_class: 1 },
  { origin: 'Roxas Blvd', destination: 'Sucat Road/Dr. A Santos Avenue', toll_fee: 36, vehicle_class: 1 },
  { origin: 'Zapote', destination: 'Kawit', toll_fee: 73, vehicle_class: 1 },
  { origin: 'Zapote', destination: 'Sucat Road/Dr. A Santos Avenue', toll_fee: 36, vehicle_class: 1 },
  { origin: 'Kawit', destination: 'Sucat Road/Dr. A Santos Avenue', toll_fee: 109, vehicle_class: 1 },
  { origin: 'C5 Road Extension/C.P.Garcia', destination: 'Roxas Blvd', toll_fee: 36, vehicle_class: 1 },
  { origin: 'C5 Road Extension/C.P.Garcia', destination: 'Zapote', toll_fee: 36, vehicle_class: 1 },
  { origin: 'C5 Road Extension/C.P.Garcia', destination: 'Kawit', toll_fee: 109, vehicle_class: 1 },
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
  { origin: 'Tipo', destination: 'Tarlac City', toll_fee: 291, vehicle_class: 1 },
  # Add more SCTEX rates as needed
]

# SKYWAY STAGE 3 Toll Rates - Class 1 Vehicles
skyway_stage_3 = Expressway.find_by!(name: 'SKYWAY STAGE 3')
skyway_stage_3_rates = [
  # Buenida entry point rates
  { origin: 'Buendia', destination: 'Quirino', toll_fee: 105, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'Plaza Azul', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'Nagtahan', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'Aurora Blvd', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'E. Rodriguez', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'Quezon Ave', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'Balintawak', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Buendia', destination: 'NLEX', toll_fee: 264, vehicle_class: 1 },
  # Quirino entry point rates
  { origin: 'Quirino', destination: 'Plaza Azul', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'Nagtahan', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'Aurora Blvd', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'E. Rodriguez', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'Quezon Ave', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'Balintawak', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Quirino', destination: 'NLEX', toll_fee: 264, vehicle_class: 1 },
  # Plaza Azul entry point rates
  { origin: 'Plaza Azul', destination: 'Nagtahan', toll_fee: 105, vehicle_class: 1 },
  { origin: 'Plaza Azul', destination: 'Aurora Blvd', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Plaza Azul', destination: 'E. Rodriguez', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Plaza Azul', destination: 'Quezon Ave', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Plaza Azul', destination: 'Balintawak', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Plaza Azul', destination: 'NLEX', toll_fee: 264, vehicle_class: 1 },
  # Nagtahan entry point rates
  { origin: 'Nagtahan', destination: 'Aurora Blvd', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Nagtahan', destination: 'E. Rodriguez', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Nagtahan', destination: 'Quezon Ave', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Nagtahan', destination: 'Balintawak', toll_fee: 264, vehicle_class: 1 },
  { origin: 'Nagtahan', destination: 'NLEX', toll_fee: 264, vehicle_class: 1 },
  # E. Rodriguez entry point rates
  { origin: 'E. Rodriguez', destination: 'Quezon Ave', toll_fee: 129, vehicle_class: 1 },
  { origin: 'E. Rodriguez', destination: 'Balintawak', toll_fee: 129, vehicle_class: 1 },
  { origin: 'E. Rodriguez', destination: 'NLEX', toll_fee: 129, vehicle_class: 1 },
]

# Create all routes
def create_bidirectional_route(expressway, data)
  puts "Creating route from #{data[:origin]} to #{data[:destination]} with toll fee #{data[:toll_fee]} for Class #{data[:vehicle_class]}"

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
cavitex_rates.each { |rate| create_bidirectional_route(cavitex, rate) }
skyway_stage_3_rates.each { |rate| create_bidirectional_route(skyway_stage_3, rate) }

# Create Class 2 and 3 rates based on multipliers
def create_other_vehicle_classes(expressway, rates)
  rates.each do |rate|
    # Class 2 (x2.5 of Class 1)
    create_bidirectional_route(expressway, {
      origin: rate[:origin],
      destination: rate[:destination],
      toll_fee: (rate[:toll_fee] * 2.51).round,
      vehicle_class: 2
    })

    # Class 3 (x3 of Class 1)
    create_bidirectional_route(expressway, {
      origin: rate[:origin],
      destination: rate[:destination],
      toll_fee: (rate[:toll_fee] * 3.01).round,
      vehicle_class: 3
    })
  end
end

create_other_vehicle_classes(nlex, nlex_rates)
create_other_vehicle_classes(sctex, sctex_rates)
