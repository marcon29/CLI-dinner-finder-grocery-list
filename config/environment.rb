require_relative "version"

require 'bundler/setup'
Bundler.require(:default)

module CliDinnerFinderGroceryList
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "../lib/cli"
require_relative "../lib/recipes"
require_relative "../lib/scraper_category"
require_relative "../lib/scraper_recipe"
