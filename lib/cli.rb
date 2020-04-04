class CLI

######  User options  ######
  # need main menu (see below)
  # need a meal type menu
      # list of meal types (i.e. main dishes, side dishes, breakfast, lunch, etc.)
          # hard code in way to make extendable
  # need main dish menu
      # list of main dishes (i.e. beef, chicken, vegetarian, etc.)
  # need side dish menu
      # list of side dishes (i.e. vegetables, rice, potatoes, etc.)


######  User actions (besides adding recipes)  ######
  # need to view all recipes
      # requires a Recipes.all
  # need delete a recipe
      # requires Recipes.all, single-instance finder, single-instance remover
  # need clear all recipes
      # requires Recipes.all, Recipes.all.clear
  # need view all ingredients
      # requires Recipes.all, filter for ingredients only


######  Object Relationships  ######
  # CLI/recipe ojects
      # CLI instantiates objects
      # CLI has access to instnaces via Recipes.all
  # CLI/category ojects
      # CLI instantiates objects
      # CLI has access to instnaces via Categories.all
      # CLI passes data from category object to recipe object (at instantiation)
  # recipe/category ojects
      # through CLI
  # scraper/recipe/category ojects
      # recipes and categories need access to scraper methods only (class methods)


######  Flow  ######
  # greeting
  puts "Welcome to the Dinner Finder & Grocery List Maker CLI app"
  puts ""
  puts "Add recipes from Allrecipes.com and get a list of ingredients so you know what to get at the store."
  puts "Add a recipe to get started."

  # print main menu
  puts ""
  puts "What would you like to do? (enter number)"
  puts "1. add recipe"
      # add recipe
      # view recipes (names only from all recipe instances)
      # delete recipe (single recipe instance, by recipe name)
      # clear all recipes (all recipe instances)
      # print ingredients (ingredients only from all recipe instances)

      # get recipe name or browse
  puts ""
  puts "If you know the recipe you want, enter its name. If not, enter 'browse'."
  puts "(You must enter the exact name to find a specific recipe.)"
  input = gets.strip.downcase
  Recipes.new(input)
      # if get name
          # user input, returns recipe name
          # instantiate recipe object using name
      # if browse
          # main or side? (make array so can add more later - see above meal type menu?)
          # display applicable menu: main dish menu or side dish menu (all category options)
          # get category selection
              # user input, returns category name
              # instantiate category object using name
          # print recipe options for category
          # user selects recipe (loop back to getting recipe name above)
  # use recipe instances for all other functionality

end
