class PageType
  attr_accessor :name, :slug, :items

  BASE_URL = "https://www.allrecipes.com/recipe"

  def initialize(name)
    @name = name
    #@slug = name.gsub(" ", "-").downcase
    @slug = name.gsub(/[" "']/, " " => "-", "'" => "").downcase
  end

  def self.all_names
    self.all.collect { |o| o.name }
  end

  def self.all_items
    self.all.collect { |o| o.items }
  end

  def self.find_by_name(name)
    self.all.detect { |o| o.name == name }
  end
end
