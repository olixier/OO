class Bicycle  
  attr_reader :gears, :wheels, :seats  
  def initialize(gears = 1)  
    @wheels = 2  
    @seats = 1  
    @gears = gears  
  end  
end  

class Tandem < Bicycle  
  def initialize(gears)  
    super(gears)
    @seats = 2  
  end  
end  

# our Bicycle object
b = Bicycle.new
puts b.gears  
puts b.wheels  
puts b.seats  

# our Tandem object inheriting from bicycle
t = Tandem.new(2)  
puts t.gears  
puts t.wheels  
puts t.seats