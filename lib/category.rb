class Category < PageType
  # make base url variable???
  # full: https://www.allrecipes.com/recipes/main-dish/beef/
      #veg: https://www.allrecipes.com/recipes/everyday-cooking/vegetarian/main-dishes/
  # base: https://www.allrecipes.com/recipes/
  # meal type: main-dish/
      #veg: everyday-cooking/vegetarian/main-dishes/
  # category: beef/
  # base << meal type << category <<

  @@all = []

  def initialize(name)
    super
    #@items = Scraper.scrape_category(create_url)
    get_items
    @@all << self
  end

  def get_items
    if @name == "meal type"
      @items =  ["main dish", "side dish"]
    elsif @name == "main dish"
      @items =  ["beef", "chicken"]
    else
      @items = Scraper.scrape_category(create_url)
    end
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  def self.all
    @@all
  end
end
