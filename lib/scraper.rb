require 'open-uri'

class Scraper

  def self.scrape_recipe(url)
    doc = Nokogiri::HTML(open(url))
    items = doc.css(".checkList__line")
    items = doc.css(".ingredients-item-name") if items.count == 0   # for chicken, pork, and dinner salads

    ingredients = []

    items.each do |i|
      if i.text.strip  != "Add all ingredients to list" && i.text.strip != ""
        ingredients << i.text.strip
      end
    end
    ingredients
  end

   def self.scrape_category(url)
     doc = Nokogiri::HTML(open(url))
     items = doc.css(".fixed-recipe-card h3")
     items.collect { |i| i.text.strip }
   end
end
