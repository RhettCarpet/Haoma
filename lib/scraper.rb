require 'nokogiri'
require 'open-uri'


puts "Search item?"
recipe = gets.chomp.to_s

url = "https://www.chefkoch.de/rs/s0/#{recipe}/Rezepte.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.search-list-item-title').each do |element|
  puts element.text.strip
end


