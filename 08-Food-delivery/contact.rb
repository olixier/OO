class Contact

	# attr_reader :address, :city, :postal_code, :telephone, :owner

	def initialize(owner, args)
		@owner = owner
		@address = args[:address]
		@city = args[:city]
		@postal_code = args[:postal_code]
		@telephone = args[:telephone]
		@owner.contact = self
	end

end
