class Employee

	attr_accessor :contact
	attr_reader :restaurant, :orders_pending, :name

	def initialize(restaurant, info)
		@name = info[:name]
		@password = info[:password]
		@restaurant = restaurant
		@restaurant.employees << self
		@orders_pending = []
		@contact = Contact.new(self, info)
	end

	def set_contact(info)
		Contact.new(self, info)
	end

	def to_s
		@name
	end

	def assign_order(order, employee)
		order.set_responsible(employee)
	end

	def push_order(order)
		order.push_order
	end

	# def options
	# 	["list_customers", "add_customers", "view_orders", "add_order", "remove_order"]
	# end

end

class Cook < Employee

end

class Manager < Employee

	attr_reader :orders

	def initialize(restaurant, info)
		super(restaurant, info)
		@orders = []
	end

	def add_employee(info)
		case info[:position]
		when "manager"
			new_employee = Manager.new(self.restaurant, info)
		when "cook"
			new_employee = Cook.new(self.restaurant, info)
		when "deliveryboy"
			new_employee = DeliveryBoy.new(self.restaurant, info)
		end
		return new_employee
	end

	def add_customer(info)
		Customer.new(self.restaurant, info)
	end

	def add_item(name, price)
		Item.new(name, price)
	end

	def add_order(customer, *items)
		Order.new(self.restaurant, self, customer, *items)
	end

end

class DeliveryBoy < Employee
	
	def push_order(order)
		super(order)
		assign_order(order, nil)
	end

end
