require_relative "version"

require 'bundler/setup'
Bundler.require(:default)

module CliDinnerFinderGroceryList
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "../lib/scraper"
require_relative "../lib/pagetype"
require_relative "../lib/recipe"
require_relative "../lib/category"
require_relative "../lib/cli"
