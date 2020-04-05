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
  def self.all_instance_names
    self.all.collect { |o| o.name }
  end

  # return all object items
  def self.all_items_names
    self.all.collect { |o| o.items }
  end
end
