require 'csv'

class CSVManager

  def self.load(file)
    CSV.open(file) do |f|
      @categories = f.readline.map { |name| name.to_sym }
      table = []
      until f.eof?
        row = f.readline
        row = @categories.zip(row).flatten
        table << Hash[*row]
      end
      table
    end
  end

  def self.save(file, cookbook)
    CSV.open(file, 'w') do |csv|
      csv.puts(@categories)
      cookbook.recipes.each do |recipe| 
        csv.puts(recipe.values)
      end
    end

  end

end
    

# old version of load
# CSV.open(file) do |f|
#   @categories = f.readline.map { |name| name.to_sym }
#   table = []
#   until f.eof?
#     row = f.readline
#     row = @categories.zip(row).flatten
#     table << Hash[*row]
#   end
#   table
# end
