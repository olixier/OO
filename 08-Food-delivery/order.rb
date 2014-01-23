class Item

	def initialize(name, price)
		@name = name
		@price = price
	end

	def to_s
		@name
	end

end

class Order

	attr_reader :items, :manager, :list
	attr_accessor :responsible

	def initialize(restaurant, manager, customer, items)
		@restaurant = restaurant
		@restaurant.customers << @customer unless @restaurant.customers.include?(@customer)
		@manager = manager
		@manager.orders << self
		@manager.orders_pending << self
		@responsible = manager
		@customer = customer
		@customer.orders << self
		@customer.restaurants << @restaurant unless @customer.restaurants.include?(@restaurant)
		@items = items
		@order_date = Time.now
		@list = OrderList.all_lists[0] # à changer pour vraie liste
		@list.orders << self # idem que au dessus
	end

	def to_s
		@order_date.strftime("Order on %d/%m/%y by #{@customer}")
	end

	def set_responsible(employee)
		self.responsible.orders_pending.delete(self)
		self.responsible = employee
		employee.orders_pending << self unless employee.nil?
	end

	def push_order
		@list.orders.delete(self)
		@list = @list.next
		@list.orders << self
	end


	# def self.add_order(restaurant)
	# 	puts "existing customer? Y / N"
	# 	if gets.chomp == N
	# 		Customer.add_customer
	# 	else
	# 		 restaurant.customers.each {|customer| puts customer}
	# 	end
	# end

end

class OrderList

	attr_reader :name, :orders, :position

	@all_lists = []

	class << self
		attr_accessor :all_lists
	end

	def initialize(restaurant, name, position)
		@restaurant = restaurant
		@name = name
		@position = position
		@orders = []
		@restaurant.order_lists << self
		OrderList.all_lists << self
	end

	def to_s
		@name
	end

	def next
		OrderList.all_lists.find { |list| list.position == self.position + 1 }
	end

end