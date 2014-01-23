require 'csv'


# CSV.foreach('items.csv') { |row| Item.new(row[0], row[1].to_i) }
# CSV.foreach('employees.csv') { |row| Employee.new(row[0], row[1]) }

class CSV

	def self.create_employees(restaurant, file)
		CSV.data_to_table(file).each { |hash| restaurant.add_employee(hash) }
		return nil
	end

	def self.create_customers(restaurant, file)
		CSV.data_to_table(file).each { |hash| restaurant.add_customer(hash) }
		return nil
	end

	def self.data_to_table(file)
		CSV.open(file) do |f| 
			columns = f.readline.map { |name|  name.to_sym }
			table = []
			until f.eof?
				row = f.readline
				row = columns.zip(row).flatten
				table << Hash[*row]
			end
			table		
		end
	end

end