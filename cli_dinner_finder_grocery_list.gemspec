
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "cli_dinner_finder_grocery_list/version"
require "config/version"

Gem::Specification.new do |spec|
  spec.name          = "cli_dinner_finder_grocery_list"
  spec.version       = CliDinnerFinderGroceryList::config::VERSION
  spec.authors       = ["'Mark Stabler'"]
  spec.email         = ["'online@markstabler.com'"]

  spec.summary       = %q{Collect dinner recipes from Allrecipes.com, then compile all the ingredients to make grocery list. All from your CLI.}
  spec.description   = %q{Browse Allrecipes.com for dinner recipes, main dishes and side dishes, by primary ingredient. Collect as many recipes as you want. When you’re done, compile all the ingredients from your selected recipes to to make grocery shopping list. All from your CLI. }
  spec.homepage      = "https://github.com/marcon29/dinner-finder-grocery-list-CLI.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
