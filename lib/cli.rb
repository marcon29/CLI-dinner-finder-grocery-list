######  User options  ######
  # need main menu (see below)
  # need a meal type menu
      # list of meal types (i.e. main dishes, side dishes, breakfast, lunch, etc.)
          # hard code in way to make extendable
  # need main dish menu
      # list of main dishes (i.e. beef, chicken, vegetarian, etc.)
  # need side dish menu
      # list of side dishes (i.e. vegetables, rice, potatoes, etc.)

class CLI
  # need to exit at any time

  def self.main_menu
  #def main_menu
    puts "What would you like to do? (enter number)"
    puts "1. add recipe"
    puts "2. view all recipes"
    puts "3. delete a recipe"
    puts "4. delete ALL recipes"
    puts "5. view all recipe ingredients"
    puts "6. exit"

    input = gets.strip

    if input.to_i.between?(1,6)
      case input
        when "1"
          # add recipe
          get_recipe
          main_menu
        when "2"
          # view recipes (names only from all recipe instances)
          puts Recipes.all_names
          main_menu
        when "3"
          puts "you still need to figure out best way to do this"
          # delete recipe (single recipe instance, by recipe name)
          main_menu
        when "4"
          # clear all recipes (all recipe instances)
          Recipes.delete_all
          main_menu
        when "5"
          # print ingredients (ingredients only from all recipe instances)
          puts Recipes.all_ingredients
          main_menu
        when "6"
          puts "Goodbye"
      end
    else
      "Please enter only 1, 2, 3, 4, or 5"
    end
  end

      # get recipe name or browse
  def self.get_recipe
  #def get_recipe
    puts "If you know the recipe you want, enter its name. If not, enter 'browse'."
    puts "(You must enter the exact name to find a specific recipe.)"
    input = gets.strip.downcase

    # if browse, call browse method
    # if get name: use user input as recipe name to instantiate recipe object
    if input == "browse" || input == "find" || input == "search" || input == "lookup"
      puts "You still need to build the browse functionality."
    else
      Recipes.new(input)
      # need validation for bad entries
    end
  end
end
      # if browse
          # main or side? (make array so can add more later - see above meal type menu?)
          # display applicable menu: main dish menu or side dish menu (all category options)
          # get category selection
              # user input, returns category name
              # instantiate category object using name
          # print recipe options for category
          # user selects recipe (loop back to getting recipe name above)
