class Recipes
  attr_accessor :name, :slug, :ingredients

  # make base url variable???

  # collects all recipes into array
  @@all = []

  def initialize(name)
    @name = name
    @slug = name.gsub(" ", "-").downcase
    @ingredients = Scraper.scrape_recipe(create_url)
    @@all << self
  end

  # converts recipe name to url
  def create_url
    "https://www.allrecipes.com/recipe/" << slug
  end

  # return all recipes
  def self.all
    @@all
  end

  # find a recipe (returns recipe object, nil if names don't match)
  def self.find_by_name(name)
#    search_name = name.split.collect(&:capitalize).join(' ')
#    self.all.detect { |r| r.name == search_name }
    self.all.detect { |r| r.name == name }
  end

  # delete a recipe
  def self.delete(name)
    # search_name = name.split.collect(&:capitalize).join(' ')
    # self.all.delete_if { |r| r.name == search_name }
    self.all.delete_if { |r| r.name == name }
  end

  # delete all recipes
  def self.delete_all
    self.all.clear
  end

  # get only names from all recipes
  def self.all_names
    self.all.collect { |r| r.name }
  end

  # get only ingredients from all recipes (returns nested array)
  def self.all_ingredients
    self.all.collect { |r| r.ingredients }
  end

end
