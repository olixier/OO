# class CreationError < StandardError
# end

class Restaurant

	attr_accessor :contact, :order_lists
	attr_reader :employees, :customers, :name

	def initialize(info)
		# raise CreationError, "No name provided" if args[:name].nil?
		@name = info[:name]
		@employees = []
		@customers = []
		@order_lists = []
		@contact = Contact.new(self, info)
	end

	def add_employee(info)
		case info[:position]
		when "manager"
			new_employee = Manager.new(self, info)
		when "cook"
			new_employee = Cook.new(self, info)
		when "deliveryboy"
			new_employee = DeliveryBoy.new(self, info)
		end
		return new_employee
	end

	def set_contact(info)
		Contact.new(self, info)
	end

	def add_order_list(name, position)
		OrderList.new(self, name, position)
	end

	def add_customer(info)
		Customer.new(self, info)
	end

	def add_item(name, price)
		Item.new(name, price)
	end

end