# CliDinnerFinderGroceryList

Browse Allrecipes.com for dinner recipes, main dishes and side dishes, by primary ingredient. Collect as many recipes as you want. When you’re done, compile all the ingredients from your selected recipes to to make grocery shopping list. All from your CLI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "CLI-dinner-finder-grocery-list", :git => "git@github.com:marcon29/CLI-dinner-finder-grocery-list.git"
```

And then execute (requires Bundler):

    $ bundle install

Add to application program file(s):

    $ require "CLI-dinner-finder-grocery-list"

## Usage
Once installed, navigate to the application's main directory:

    $ cd CLI-dinner-finder-grocery-list

Then type type the folling in your command line:

    $ bin/cli_dinner_finder_grocery_list

Select options by number to add and remove recipes to your collection. You can also view the recipes in your collection. Once you have your meal(s) planned out, select "4. Create grocery list" from the home menu to display only the ingredients for all your recipes.

[Video Walkthrough](https://drive.google.com/file/d/1qjQE7jg9ga_EebTElMBDx6cz2KdZqKQs/view?usp=sharing)

## Development

To clone to your local environment::

    $ git clone "git@github.com:marcon29/CLI-dinner-finder-grocery-list.git"

To release a new version, update the version number in `config/version.rb`.

This was designed to allow easy extension of meal options. See comments in `lib/category.rb`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcon29/cli_dinner_finder_grocery_list.git. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Code of Conduct

Everyone interacting in the CliDinnerFinderGroceryList project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/marcon29/CLI-dinner-finder-grocery-list/blob/master/CODE_OF_CONDUCT.md).
