# make base url variable???
# full: https://www.allrecipes.com/recipes/main-dish/beef/
    #veg: https://www.allrecipes.com/recipes/everyday-cooking/vegetarian/main-dishes/
# base: https://www.allrecipes.com/recipes/
# meal type: main-dish/
    #veg: everyday-cooking/vegetarian/main-dishes/
# category: beef/
# base << meal type << category <<

class Category < PageType
  # attr_accessor :name, :slug, :items
  attr_accessor :parent

  @@all = []

  def initialize(name)
    super
    # @name = name
    # @slug = name.gsub(" ", "-").downcase
    get_attributes
    @@all << self
  end

  @@meal_type = ["main dish", "side dish"]     # this will be the place to extend
  @@dish_type = []

  def get_attributes
    if @name == "meal type"
      @items =  @@meal_type
      @parent = "main"
    elsif @@meal_type.include?(@name)          # this will become a scraper
      @items =  ["beef", "chicken"]
      # scrape => array of dish options
            # @items =  ["scraped1", "scraped2"..."scrapedN"]
      @items.each { |i| @@dish_type << i }
      @parent = "meal type"
    else #@@dish_type.include?(@name)
      @items = Scraper.scrape_category(create_url)
      @parent = @@meal_type.detect do |mt|
        Category.find_by_name(mt).items.detect { |dt| dt == @name }
      end
    end
binding.pry
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  def self.all
    @@all
  end

  def self.meal_type
    @@meal_type
  end

  def self.dish_type
    @@dish_type
  end

  def menu
    count = items.count

    puts "Choose a #{@name} recipe (enter 1-#{count+1})"
    items.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
    puts "#{count+1}. Nevermind. Go back."

    input = gets.strip.to_i
    puts ""

    if input.between?(1, count)
      selection = items[input-1]
    elsif input == count+1
      puts "Yeah, let's look at something else."
      selection = "back"
    else
      puts "That option is not on the list."
      selection = "bad input"
    end
    selection
  end


end
