class Category < PageType
  attr_accessor :parent, :cat_slug

  @@all = []

  # add to following arrays to extend what pages are scraped on website
  # double check that url logic still works, may also need to adjust scrape parameters
  @@meal_types = ["main dish", "side dish"]
  @@main_dishes = ["beef", "chicken", "vegetarian"]
  @@side_dishes = ["vegetables", "vegetarian"]

  def initialize(name)
    super
    get_attributes
    @@all << self
  end

  def get_attributes
    if @name == "meal type"
      @parent = "main"
      @items =  @@meal_types
    elsif @@meal_types.include?(@name)
      @parent = "meal type"
      @cat_slug = @parent.gsub(" ", "-").downcase

      # the commented out code on next line is to switch to using scraper for meal types
            # @items = Scraper.scrape_category(create_url)
                # only returns top items on type pages
                # will require some refactoring to add this and keep full browsing abilities
      if @name == "main dish"
        @items =  @@main_dishes
      elsif @name == "side dish"
        @items =  @@side_dishes
      end
    else
      @parent = @@meal_types.detect do |mt|
        Category.find_by_name(mt).items.detect { |dt| dt == @name }
      end

      @cat_slug = @parent.gsub(" ", "-").downcase
      @items = Scraper.scrape_category(create_url)
    end
  end

  def create_url
    if @name == "vegetarian" || @name == "vegan"
      "#{BASE_URL}s/everyday-cooking/#{@slug}/#{@cat_slug}es/"
    else
      "#{BASE_URL}s/#{@cat_slug}/#{@slug}/"
    end
  end

  def menu
    count = items.count

    puts "Choose a #{@name} recipe (enter 1-#{count+1})"
    items.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
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

  def self.meal_type
    @@meal_type
  end
end
