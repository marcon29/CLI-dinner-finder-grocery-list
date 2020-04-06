class PageType
  attr_accessor :name, :slug, :items

  def initialize(name)
    @name = name
    @slug = name.gsub(" ", "-").downcase
  end

#   def create_url
# #    "https://www.allrecipes.com/recipes/main-dish/" << slug
# #    "https://www.allrecipes.com/recipe/" << slug
#   end

  # return all object names
  def self.all_names
    self.all.collect { |o| o.name }
  end

  # return all object items
  def self.all_items
    self.all.collect { |o| o.items }
  end

  # find an object (returns object, nil if names don't match)
  def self.find_by_name(name)
    self.all.detect { |o| o.name == name }
  end
end
