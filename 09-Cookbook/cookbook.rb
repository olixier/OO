require_relative 'recipe'
require_relative 'csv'

class CookBook

  attr_reader :recipes

  def initialize(file)
    @file = file
    @recipes = []
    CSVManager.load(file).each { |info| @recipes << Recipe.new(info) }
  end

  def list
    puts @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def delete_recipe_with_index(index)
    @recipes.delete_at(index)
  end

end