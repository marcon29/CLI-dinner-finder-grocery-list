require 'open-uri'

class Scraper

  # real versions
  def self.scrape_recipe(url)
    doc = Nokogiri::HTML(open(url))
    items = doc.css(".checkList__line")

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


#######################################
  # # stub versions for testing
  #
  # # url = "https://www.allrecipes.com/recipe/quick-italian-skillet-dinner/"
  # def self.scrape_recipe(url=nil)
  #   ingredients = [
  #     "1 pound Italian sausage",
  #     "1/2 cup chopped green bell pepper",
  #     "1 medium onion, chopped",
  #     "1 (14.5 ounce) can RED GOLD® Diced Tomatoes",
  #     "2 cups RED GOLD® Vegetable Juice from Concentrate",
  #     "1 1/2 cups instant rice",
  #     "1 cup shredded mozzarella cheese"
  #   ]
  # end
  #
  # # url = "https://www.allrecipes.com/recipes/main-dish/beef/"
  # def self.scrape_category(url=nil)
  #   if url == "beef"
  #     dishes = [
  #       "Beef Stroganoff III",
  #       "Crispy Orange Beef",
  #       "Awesome Slow Cooker Pot Roast",
  #       "Brown Sugar Meatloaf",
  #       "Easy Meatloaf",
  #       "Salisbury Steak",
  #       "Meatball Nirvana",
  #     ]
  #   elsif url == "chicken"
  #     dishes = [
  #       "BBQ Chicken Pizza",
  #       "Skillet Chicken Bulgogi",
  #       "Chef John's Calabrian Chicken",
  #       "Chicken Lemon Linguine",
  #       "Honey-Mustard Chicken with Roasted Vegetables",
  #       "Garlic Cheddar Chicken"
  #     ]
  #   end
  # end

#######################################
end
