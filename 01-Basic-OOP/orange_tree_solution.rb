#######################################################

# DON'T LOOK AT IT BEFORE HAVING CODED YOUR SOLUTION FIRST !

#######################################################

class OrangeTree
  
  def initialize
    @height = 0.0
    @orange_count = 0
    @alive = true
  end
  
  def measure_height
    @alive ? "#{@height} m" : "A dead tree is not very tall.."
  end
  
  def count_the_oranges
    @alive ? "#{@orange_count} oranges" : "A dead tree has no oranges.."
  end
  
  def pick_an_orange!
    if @alive
      if self.any_orange? 
        @orange_count -= 1
        "You pick a delicious juicy orange"
      else
        "You search every branch.. but no oranges"
      end
    else
      "A dead tree has nothing to offer.."
    end
  end
  
  def any_orange?
    @orange_count > 0 
  end
  
  def one_year_passes!
    if @alive
      @height += 0.4
      @orange_count = 0 # old oranges fall off
      
      if @height >  10 && rand(2) > 0
        # tree dies
        @alive = false
        "Oh, no! The tree is too old, and has died.."
      elsif @height > 2
        @orange_count = (@height * 15 -25).to_i
        "This year your tree grew to #{@height} m tall," +
        " and produced #{@orange_count} oranges"
      else
        "This year your tree grew to #{@height} m tall," +
        " but it's still to young to produce fruit."
      end
    else
      "A year later, the tree is still dead.."
    end
  end
        
end
