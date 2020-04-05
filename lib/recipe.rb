class Recipe < PageType
  # make base url variable???

  @@all = []

  def initialize(name)
    super
    @items = Scraper.scrape_recipe(create_url)
    @@all << self
  end

  # converts recipe name to url
  def create_url
    "https://www.allrecipes.com/recipe/" << slug
  end

  def self.all
    @@all
  end

  # find a recipe (returns recipe object, nil if names don't match)
  def self.find_by_name(name)
    self.all.detect { |r| r.name == name }
  end

  # delete a recipe
  def self.delete(name)
    self.all.delete_if { |r| r.name == name }
  end

  # delete all recipes
  def self.delete_all
    self.all.clear
  end


end
