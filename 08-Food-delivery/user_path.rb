require_relative 'restaurant'
require_relative 'contact'
require_relative 'employee'
require_relative 'customer'
require_relative 'order'
require_relative 'csv'

# create Restaurant

taco_bell_info = { name: "Taco Bell",
				   address: "Avenue des Champs Elysees",
				   city: "Paris",
				   postal_code: "75008",
				   telephone: "0101010101"
}

taco_bell = Restaurant.new(taco_bell_info)

# create Order List

order_list = taco_bell.add_order_list("New orders", 0)
order_list_2 = taco_bell.add_order_list("Cooked, to be delivered", 1)
order_list_3 = taco_bell.add_order_list("Delivered", 2)

puts taco_bell.order_lists # => 3 lists

# create manager

christine_info = { name: "Christine",
				   password: "1234",
				   address: "Avenue de la Republique",
				   city: "Paris",
				   postal_code: "75011",
				   telephone: "0601010101",
				   position: "manager",
}


christine = taco_bell.add_employee(christine_info)

puts taco_bell.employees # test => christine

# Christine creates a new cook

james_info = { name: "James",
			   password: "1234",
			   address: "Avenue de la Republique",
			   city: "Paris",
			   postal_code: "75011",
			   telephone: "0601010101",
			   position: "cook"
}

james = christine.add_employee(james_info)


# Christine creates a new deliveryboy

gary_info = { name: "Gary",
			  password: "1234",
			  address: "Avenue de la Republique",
			  city: "Paris",
			  postal_code: "75011",
			  telephone: "0601010101",
			  position: "deliveryboy"
}

gary = christine.add_employee(gary_info)

puts taco_bell.employees # test => christine, james & gary

# Christine creates a new item in the menu

enchilladas = christine.add_item("Enchilladas", 12)

puts enchilladas # => "Enchilladas"

# Christine adds a new customer

benoit_info = { name: "Benoit",
			    address: "Avenue de la Republique",
			    city: "Paris",
			    postal_code: "75011",
			    telephone: "0601010101",
			}

benoit = christine.add_customer(benoit_info)

puts taco_bell.customers # => Benoit

# Christine adds a new order for this customer

order = christine.add_order(benoit, enchilladas)

# taco_bell.order_lists.each { |list| puts list.orders }
# puts benoit.orders
# puts christine.orders
# puts order.items

# Christine assigns this new order to James

christine.assign_order(order, james)

puts james.orders_pending

# James cooks the pending order

james.push_order(order)
james.assign_order(order, christine)

puts order.list # To be delivered
puts order.responsible # christine

# Christine assigns the order to Gary to be delivered
christine.assign_order(order, gary)

puts order.responsible

# Gary delivers the pending item
gary.push_order(order)

puts order.list # delivered
puts order.responsible # nil
