require_relative 'csv'
require_relative 'cookbook'

class Controller

  attr_reader :cookbook

  TASKS = {
    list: "- list all recipes? (list)",
    add: "- add a recipe? (add)", 
    del: "- delete a recipe? (del)",
    exit: "- exit? (exit)"
  }

  def initialize(file)
    @file = file
    @cookbook = CookBook.new(file)
  end

  def display_tasks
    puts TASKS.values
  end

  def get_task
    @user_input = gets.chomp.to_sym

    unless TASKS.keys.include?(@user_input) 
      puts "invalid input, please retry"
      self.get_task
    end
  end

  def execute_task                  
    self.send(@user_input)
  end

  private

  def list
    @cookbook.list
  end

  def add
    puts "What recipe do you want to add?"
    info = {}
    puts "Name?"
    info[:name] = gets.chomp
    puts "Rating? (out of 5)"
    info[:rating] = gets.chomp
    puts "Preparation time? (in min)"
    info[:preparation] = gets.chomp
    puts "Cooking time? (in min)"
    info[:cooking] = gets.chomp
    @cookbook.add_recipe(Recipe.new(info))
    puts "Added!"
  end

  def del
    puts "Which recipe do you want to delete? (use index)"
    @cookbook.recipes.each_with_index { |recipe, index| puts "#{index} - #{recipe}" }
    @cookbook.delete_recipe_with_index(gets.chomp.to_i)
    puts "Deleted!"
  end

  def exit
    puts "thank you for using our software. see u next time"
    CSVManager.save(@file, @cookbook)
    Process.exit!(true)
  end

end