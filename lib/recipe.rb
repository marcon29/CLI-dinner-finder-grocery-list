class Recipe < PageType
  @@all = []

  def initialize(name)
    super
    @items = Scraper.scrape_recipe(create_url)
    @@all << self
  end

  def create_url
    "#{BASE_URL}/#{@slug}/"
  end

  def self.all
    @@all
  end

  def self.delete(name)
    self.all.delete_if { |r| r.name == name }
  end

  def self.delete_all
    self.all.clear
  end
end
