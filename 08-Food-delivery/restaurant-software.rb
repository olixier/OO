require_relative 'restaurant'
require_relative 'contact'
require_relative 'employee'
require_relative 'customer'
require_relative 'order'
require_relative 'csv'

taco_bell_info = { name: "Taco Bell",
				   address: "Avenue des Champs Elysees",
				   city: "Paris",
				   postal_code: "75008",
				   telephone: "0101010101"
}

taco_bell = Restaurant.new(taco_bell_info)

puts taco_bell

CSV.create_employees(taco_bell, 'employees.csv')
CSV.create_customers(taco_bell, 'customers.csv')


puts taco_bell.employees
puts taco_bell.customers