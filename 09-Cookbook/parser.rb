require 'nokogiri'

doc = Nokogiri::HTML(File.open('marmiton.html'))

doc.search('.m_search_result').each do |element|
    puts "#{element.search('.m_search_titre_recette > a').inner_text}"
    puts "Rating : #{element.search('.etoile1').size} / 5"
    puts "Preparation time (in min) : #{element.search('.m_search_result_part4').inner_text.match(/Préparation : (\d+) min/)[1]}"
    puts "Cooking time (in min) : #{element.search('.m_search_result_part4').inner_text.match(/Cuisson : (\d+) min/)[1]}"
end