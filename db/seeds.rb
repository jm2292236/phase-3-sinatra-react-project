puts "🌱 Seeding spices..."

# Create vehicles
# ===============
civic15 = Vehicle.create(make: "Honda", model: "Civic", year: 2015, license_plate: "ABC123456", registration_due_month: 7)
civic16 = Vehicle.create(make: "Honda", model: "Civic", year: 2016, license_plate: "CDE123456", registration_due_month: 9)
cadillac = Vehicle.create(make: "Cadillac", model: "SVT-S", year: 2020, license_plate: "CDL112233", registration_due_month: 3)
rogue = Vehicle.create(make: "Nissan", model: "Rogue", year: 2010, license_plate: "ROGUE", registration_due_month: 10)

# Create Services
# ===============
oil_change = Service.create(description: "Oil change")
break_work = Service.create(description: "Brake work")
tire_replacement = Service.create(description: "Tire replacement")
transmission_fluid = Service.create(description: "Transimission fluid")
batery_replacement = Service.create(description: "Batery replacement")
coolant_system = Service.create(description: "Coolant system")
tire_rotation = Service.create(description: "Tire rotation")
car_wash = Service.create(description: "Car wash")

# Create Locations
# ================
costco = Location.create(name: "Costco")
chevron = Location.create(name: "Chevron")
shell = Location.create(name: "Shell")
pep_boys = Location.create(name: "Pep Boys")
autozone = Location.create(name: "Autozone")
oreilly = Location.create(name: "O'Reilly")
american_tires = Location.create(name: "American Tires")
honda = Location.create(name: "Honda Dealer")
shiny = Location.create(name: "My Shiny Car")

# Create Vehicle logs
# ===================
VehicleLog.create(
    log_date: Date.new(2022, 7, 1), 
    odometer: 250,
    miles_driven: 250,
    quantity: 8.30,
    price_per_gallon: 5.259,
    total_cost: 43.65,
    notes: "First fill-up",
    log_type: 1,
    location: costco,
    vehicle: civic15    
)

VehicleLog.create(
    log_date: Date.new(2022, 7, 5), 
    odometer: 550, # 300 miles driven
    miles_driven: 300,
    quantity: 9.01,
    price_per_gallon: 5.259,
    total_cost: 47.38,
    notes: "Second fill-up",
    log_type: 1,
    location: costco,
    vehicle: civic15    
)

VehicleLog.create(
    log_date: Date.new(2022, 7, 9),
    odometer: 750, # 200 miles driven
    miles_driven: 200,
    quantity: 7.15,
    price_per_gallon: 5.309,
    total_cost: 37.96,
    notes: "Third fill-up",
    log_type: 1,
    location: chevron,
    vehicle: civic15
)

VehicleLog.create(
    log_date: Date.new(2022, 7, 10), 
    odometer: 800,  # 50 miles driven
    miles_driven: 50,
    total_cost: 8,
    notes: "First expense",
    log_type: 3,
    service: car_wash,
    location: shiny,
    vehicle: civic15
)

VehicleLog.create(
    log_date: Date.new(2022, 1, 1), 
    odometer: 50,
    miles_driven: 50,
    quantity: 2.05,
    price_per_gallon: 5.299,
    total_cost: 10.83,
    notes: "First fill-up for Civic 2016",
    log_type: 1,
    location: costco,
    vehicle: civic16    
)

VehicleLog.create(
    log_date: Date.new(2022, 1, 2), 
    odometer: 80,
    miles_driven: 30,
    total_cost: 8,
    notes: "We wash it for the first time",
    log_type: 3,
    service: car_wash,
    location: shiny,
    vehicle: civic16
)

VehicleLog.create(
    log_date: Date.new(2021, 3, 10), 
    odometer: 100,
    miles_driven: 100,
    quantity: 5,
    price_per_gallon: 5,
    total_cost: 25,
    notes: "Fill-up #1 Cadillac",
    log_type: 1,
    location: shell,
    vehicle: cadillac    
)

VehicleLog.create(
    log_date: Date.new(2021, 3, 15), 
    odometer: 220,
    miles_driven: 120,
    quantity: 6,
    price_per_gallon: 5,
    total_cost: 30,
    notes: "Fill-up #2 Cadillac",
    log_type: 1,
    location: shell,
    vehicle: cadillac    
)

VehicleLog.create(
    log_date: Date.new(2021, 3, 20), 
    odometer: 420,
    miles_driven: 200,
    quantity: 8,
    price_per_gallon: 5,
    total_cost: 40,
    notes: "Fill-up #3 Cadillac",
    log_type: 1,
    location: chevron,
    vehicle: cadillac    
)

puts "✅ Done seeding!"
