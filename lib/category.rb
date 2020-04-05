class Category < PageType
  # make base url variable???

  @@all = []

  def initialize(name)
    super
    @items = Scraper.scrape_category(create_url)
    @@all << self
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  def self.all
    @@all
  end


end
