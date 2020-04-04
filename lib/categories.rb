class Categories
  attr_accessor :name, :slug, :recipes

  # creates recipe options list (all recipes)
  # make base url variable???

  # collects all categories into array
  @@all = []

  # gets a meal type name (from CLI)
  # gets a category name (from CLI)
  def initialize(name)
    @name = name
    @slug = name.gsub(" ", "-").downcase
#    @recipes = Scraper.scrape_category(create_url)
    @recipes = Scraper.scrape_category(@name)
    @@all << self
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  # return all categories (for possible user menu creation)
  def self.all
    @@all
  end

  # return only names of all categories (for user menu creation)
  def self.all_category_names
    self.all.collect { |r| r.name }
  end

  # return all recipe names in category (for user menu creation)
  def self.all_recipe_names
    self.all.collect { |r| r.recipes }
  end

end
