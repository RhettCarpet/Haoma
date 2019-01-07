require 'nokogiri'
require 'open-uri'


puts "Search item?"
recipe = gets.chomp.to_s

url = "https://www.chefkoch.de/rs/s0/#{recipe}/Rezepte.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.search('.search-list-item a').each do |element|
   puts element.css("search-list-item-content").css("search-list-item-title")
   puts element.css(".search-list-item-content").css(".search-list-item-title").text
   recipe_link = "https://www.chefkoch.de/" + element.attribute('href').value
   puts recipe_link

  recipe_html_file = open(recipe_link)
  recipe_doc = Nokogiri::HTML(recipe_html_file)

  recipe_doc.search('.incredients').each do |ingredient|
    puts ingredient.css('td').text.gsub(/\s+/, "  ")
  end
end





