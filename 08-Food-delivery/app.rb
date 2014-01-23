require_relative 'restaurant'
require_relative 'contact'
require_relative 'employee'
require_relative 'customer'
require_relative 'order'
require_relative 'controller'

taco_bell_info = { name: "Taco Bell",
				   address: "Avenue des Champs Elysees",
				   city: "Paris",
				   postal_code: "75008",
				   telephone: "0101010101"
}

taco_bell = Restaurant.new(taco_bell_info)

christine_info = { name: "Christine",
				   password: "1234",
				   address: "Avenue de la Republique",
				   city: "Paris",
				   postal_code: "75011",
				   telephone: "0601010101",
				   position: "manager",
}


christine = taco_bell.add_employee(christine_info)

james_info = { name: "James",
			   password: "1234",
			   address: "Avenue de la Republique",
			   city: "Paris",
			   postal_code: "75011",
			   telephone: "0601010101",
			   position: "cook"
}

james = taco_bell.add_employee(james_info)

gary_info = { name: "Gary",
			  password: "1234",
			  address: "Avenue de la Republique",
			  city: "Paris",
			  postal_code: "75011",
			  telephone: "0601010101",
			  position: "deliveryboy"
}

gary = taco_bell.add_employee(gary_info)

benoit_info = { name: "Benoit",
			    address: "Avenue de la Republique",
			    city: "Paris",
			    postal_code: "75011",
			    telephone: "0601010101",
			}

benoit = taco_bell.add_customer(benoit_info)

enchilladas = taco_bell.add_item("Enchilladas", 12)

resto_controller = Controller.new(taco_bell)

while true

	while true
		resto_controller.login
		break if resto_controller.user_sign_in?
		puts "wrong username..."
	end

	while true
		resto_controller.main_tasks
		resto_controller.get_task
		break unless resto_controller.user_sign_in?
		resto_controller.execute_task
	end

end
