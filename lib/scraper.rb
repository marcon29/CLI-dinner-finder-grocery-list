require 'open-uri'

# creates ingredient list from website data (recipe pages)
# creates recipe list from website data (category pages)
# needs respective urls
# returns ingredient and recipe lists, respecively

class Scraper

  # real versions
  # def self.scrape_recipe(url)
  #   doc = Nokogiri::HTML(open(url))
  #   items = doc.css(".checkList__line")
  #
  #   ingredients = []
  #   items.each do |i|
  #     if i.text.strip  != "Add all ingredients to list" && i.text.strip != ""
  #       ingredients << i.text.strip
  #     end
  #   end
  #   ingredients
  # end
  #
  #  def self.scrape_category(url)
  #    doc = Nokogiri::HTML(open(url))
  #    items = doc.css(".fixed-recipe-card h3")
  #    items.collect { |i| i.text.strip }
  #  end

#######################################
  # stub versions for testing

  # url = "https://www.allrecipes.com/recipe/quick-italian-skillet-dinner/"
class Scraper
  def self.scrape_recipe(url=nil)
    ingredients = [
      "1 pound Italian sausage",
      "1/2 cup chopped green bell pepper",
      "1 medium onion, chopped",
      "1 (14.5 ounce) can RED GOLD® Diced Tomatoes",
      "2 cups RED GOLD® Vegetable Juice from Concentrate",
      "1 1/2 cups instant rice",
      "1 cup shredded mozzarella cheese"
    ]
  end
end
  # url = "https://www.allrecipes.com/recipes/main-dish/beef/"
  def self.scrape_category(url=nil)
    dishes = [
      "Hamburger Steak with Onions and Gravy",
      "Beef Stroganoff III",
      "Beef Tenderloin with Ginger-Shiitake Brown Butter",
      "Blue Cheese Beef Tenderloin",
      "Crispy Orange Beef",
      "Awesome Slow Cooker Pot Roast",
      "Brown Sugar Meatloaf",
      "Easy Meatloaf",
      "Salisbury Steak",
      "Meatball Nirvana",
      "Italian Spaghetti Sauce with Meatballs",
      "Slow-Cooker Pepper Steak",
      "Rempel Family Meatloaf",
      "Stuffed Green Peppers I",
      "Slow Cooker Salisbury Steak",
      "Mini Meatloaves",
      "Garlic Prime Rib",
      "Marie's Easy Slow Cooker Pot Roast",
      "High Temperature Eye-of-Round Roast",
      "Chef John's Stuffed Peppers",
      "Foolproof Rib Roast",
      "Stuffed Peppers",
      "Chef John's Italian Meatballs",
      "Slow-Cooker Corned Beef and Cabbage"
    ]
  end

#######################################
end
