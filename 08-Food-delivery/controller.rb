require_relative 'restaurant'
require_relative 'contact'
require_relative 'employee'
require_relative 'customer'
require_relative 'order'

class Controller

	TASKS = {
		manager: [:add_employee, :add_customer, :add_order, :assign, :list_orders],
		deliveryboy: [:list_assigned, :push_order]
	}

	def initialize(restaurant)
		@restaurant = restaurant
	end

	def login
		puts "###### WELCOME TO #{@restaurant.name.upcase} EMPLOYEE PLATFORM ######"
		puts "What's your username?"
		user_name = gets.chomp
		@user = @restaurant.employees.find { |x| x.name == user_name }
	end

	def user_sign_in?
		@user.nil? ? false : true
	end

	def main_tasks
		if @user.is_a? Manager
			@tasks ||= TASKS[:manager]
		elsif @user.is_a? DeliveryBoy
			@tasks ||= TASKS[:deliveryboy]
		end
		print_tasks
	end

	def get_task
		puts "Which task (give the index)?"
		@task = @tasks[gets.chomp.to_i]
	end

	def execute_task
		case @task
		when :add_employee
		when :add_customer
		when :add_order
		when :assign
		when :list_assigned
		when :push_order
		end
	end


	private

	def print_tasks
		@tasks.each_with_index { |task, index| puts "#{index}. #{task}"}
	end

end