class Recipe

  def initialize(info)
    @name = info[:name]
    @rating = info[:rating]
    @preparation = info[:preparation]
    @cooking = info[:cooking]
  end

  def to_s
    "#{@name} (rating: #{@rating}, preparation: #{@preparation}min, cooking: #{@cooking}min)"
  end

  def values
    [@name, @rating, @preparation, @cooking]
  end

end