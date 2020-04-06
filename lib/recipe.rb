  # make base url variable???


class Recipe < PageType
  # attr_accessor :name, :slug, :items

  @@all = []

  def initialize(name)
    super
    # @name = name
    # @slug = name.gsub(" ", "-").downcase
    @items = Scraper.scrape_recipe(create_url)
    @@all << self
  end

  def create_url
    "https://www.allrecipes.com/recipe/" << slug
  end

  def self.all
    @@all
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
