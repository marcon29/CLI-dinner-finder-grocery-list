require_relative "version"

require 'bundler/setup'
Bundler.require(:default)

module CliDinnerFinderGroceryList
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "../lib/scratch"
