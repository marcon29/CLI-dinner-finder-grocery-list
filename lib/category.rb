class Category < PageType
  attr_accessor :parent, :cat_slug

  @@all = []

  # add to following class arrays to extend what pages are scraped on website
  # needs to match last part of url without hyphens
  # double check that url logic still works, may also need to adjust scrape parameters
  @@meal_types = ["main dish", "side dish"]
  @@main_dishes = ["beef", "chicken", "pork", "seafood", "turkey", "salads", "vegetarian", "vegan"]
  @@side_dishes = ["vegetables", "rice", "potatoes", "grains", "vegetarian", "vegan"]

  def initialize(name)
    super
    get_attributes
    @@all << self
  end

  def get_attributes
    if @name == "meal type"
      @parent = "main"
      @items =  @@meal_types
    elsif Category.meal_types.include?(name)
      @parent = "meal type"
      @cat_slug = parent.gsub(" ", "-").downcase

      if @name == "main dish"               # the commented out code on next line is to switch to using scraper for meal types
        @items =  Category.main_dishes      # @items = Scraper.scrape_category(create_url)
      elsif @name == "side dish"            # would replace conditional block alongside this whole comment
        @items =  Category.side_dishes      # only returns top items on type pages
      end                                   # will require some refactoring to add this and keep full browsing abilities

    else
      @parent = Category.meal_types.detect do |mt|
        if Category.find_by_name(mt)
          Category.find_by_name(mt).items.detect { |dt| dt == name }
        end
      end
      @cat_slug = parent.gsub(" ", "-").downcase
      @items = Scraper.scrape_category(create_url)
    end
  end

  def create_url
    if name == "vegetarian" || name == "vegan"
      "#{BASE_URL}s/everyday-cooking/#{slug}/#{cat_slug}es/"
    else
      "#{BASE_URL}s/#{cat_slug}/#{slug}/"
    end
  end

  def menu
    count = items.count

    puts "Choose a #{@name} recipe (enter 1-#{count+1})"
    if @parent == "main dish" || @parent == "side dish"
      items.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize}" }
    else
      items.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
    end
    puts "#{count+1}.    Nevermind. Go back."
    puts ""

    input = gets.strip.to_i

    if input.between?(1, count)
      selection = items[input-1]
    elsif input == count+1
      puts "Yeah, let's look at something else."
      puts ""
      selection = "back"
    else
      puts "That option is not on the list."
      puts ""
      selection = "bad input"
    end
    selection
  end

  def self.all
    @@all
  end

  def self.meal_types
    @@meal_types
  end

  def self.main_dishes
    @@main_dishes
  end

  def self.side_dishes
    @@side_dishes
  end
end
