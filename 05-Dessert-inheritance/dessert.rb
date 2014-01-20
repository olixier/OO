class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end 
  
  def healthy?
    return @calories < 200 ? true : false
  end
  
  def delicious?
    true
  end
  
end

class JellyBean < Dessert

  attr_accessor :flavor

  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def delicious?
    @flavor == "black licorice" ? false : true
  end
  
end

# Testing your code 
jelly = JellyBean.new("jelly bean", 130, "black licorice")
puts jelly.healthy? == true # => true : it inherits healthy? method from the Dessert class
puts jelly.delicious? == false # => true : delicious is over-ridden by the children class implementation !
