class Restaurant

	attr_reader :name, :rating, :nb_ratings
	
	@total_nb_ratings = 0
	
	class << self
		attr_accessor :total_nb_ratings
	end

	def initialize(name)
		@name = name
		@rating = 0
		@nb_ratings = 0
	end


	def rate(rating)
		@rating = (@rating * @nb_ratings + rating ) / (nb_ratings + 1)
		@nb_ratings += 1
		Restaurant.total_nb_ratings += 1
		@rating
	end
		
end


resto = Restaurant.new("Coco")

puts resto.rate(5) # => 5 ?
puts "Nb of ratings: #{resto.nb_ratings}"

puts resto.rate(7) # => 6 ?
puts "Nb of ratings: #{resto.nb_ratings}"

puts resto.rate(9) # => 7 ?
puts "Nb of ratings: #{resto.nb_ratings}"

10.times { Restaurant.new("test").rate(10) }
puts "Total nb of ratings: #{Restaurant.total_nb_ratings} " # => 13 ?