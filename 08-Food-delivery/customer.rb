class Customer

	attr_accessor :contact, :orders
	attr_reader :restaurants

	def initialize(restaurant, info)
		@name = info[:name]
		@orders = []
		@restaurants = [restaurant]
		restaurant.customers << self
		@contact = Contact.new(self, info)
	end

	def set_contact(info)
		Contact.new(self, info)
	end

	def self.add_customer
		puts "New customer name?"
		Customer.new(gets.chomp)
	end

	def to_s
		@name
	end

end