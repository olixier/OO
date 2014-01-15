class Religion
  attr_accessor :building, :people
  
  @@god = "The one true god" # Class variable
  
  def self.which_god # Class method
    "#{@@god} from the Religion class" 
  end
    
  def which_god # Instance method
    "#{@@god} from the Religion object corresponding to #{@people}" 
  end
  
  def initialize(people, god = "")    
    @people = people
    
    case people
      when "muslim" then @building = "mosquee"
      when "catholic" then @building = "church"
      when "jewish" then @building = "synagog"
    else
      @building = "never heard for this religion.."
    end
    
    @@god = god unless god.empty?
  end
end
  
# Before any religion arises..
puts Religion.which_god
  
# Come the catholics..
catholicism = Religion.new("catholic")
puts "#{catholicism.people} prays in #{catholicism.building}"
# who forgot to name their god.
puts Religion.which_god
puts catholicism.which_god

# And the muslims, who did not forget to name their god
islam = Religion.new("muslim", "Allah")
puts "#{islam.people} prays in #{islam.building}"
puts Religion.which_god
puts islam.which_god

# Oups.. it just changed the catholics god..
puts catholicism.which_god 
