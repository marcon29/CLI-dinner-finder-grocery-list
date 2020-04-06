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

  @@all = []

  def initialize(name)
    super
    # @name = name
    # @slug = name.gsub(" ", "-").downcase
    get_items
    #@items = Scraper.scrape_category(create_url)
    @@all << self
  end

  def get_items
    if @name == "meal type"
      @items =  ["main dish", "side dish"]     # this will be the place to extend
    elsif @name == "main dish"                 # this will become a scraper
      @items =  ["beef", "chicken"]
    else
      @items = Scraper.scrape_category(create_url)
    end
    # elsif @name == "category"
    #   @options =  Category.new(@name).items
    # elsif @name == "delete"
    #   @options =  Recipe.all_instance_names
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  def self.all
    @@all
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
      selection = "not on list"
    end
    selection
  end


end
