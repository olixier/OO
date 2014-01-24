require_relative 'controller'

user_controller = Controller.new('recipes.txt')

puts "-- My Cookbook --\n"
puts "hello!"

while true
  puts "\nWhat do you want to do?\n"
  user_controller.display_tasks
  user_controller.get_task
  user_controller.execute_task
end