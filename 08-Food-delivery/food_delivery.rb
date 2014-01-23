require 'csv'
require_relative 'class_definition'


# Initialisation

pizzahut = Restaurant.new( { name: 'Pizza Hut', location: 'Avenue des Champs Elysees' } )
CSV.foreach('customers.csv') { |row| Customer.new(pizzahut, row[0], row[1]) }
# CSV.foreach('items.csv') { |row| Item.new(row[0], row[1].to_i) }
# CSV.foreach('employees.csv') { |row| Employee.new(row[0], row[1]) }

# creation des orders

# (0..2).each do |num|
# 	Order.new({ customer: Restaurant.customer_db[num], items: [Restaurant.item_db[num], Restaurant.item_db[3]] })
# end

# début du programme
puts pizzahut.customer_db
# puts Restaurant.item_db
# puts Restaurant.employee_db
# puts Restaurant.order_db