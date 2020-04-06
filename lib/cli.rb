class CLI
  # need to exit at any time

  # need main menu
  def main_menu
    puts "What would you like to do? (enter number)"
    puts "1. Add recipe"
    puts "2. View all recipes"
    puts "3. Delete one or all recipes"
    puts "4. Create grocery list"
    puts "5. Exit"

    input = gets.strip

    if input.to_i.between?(1,6)
      case input
        when "1"       # add recipe, get recipe name or browse
          puts ""
          add_recipe_menu_option
          puts ""
          main_menu
        when "2"       # view recipes (names only from all recipe instances)
          puts ""
          view_recipes_menu_option
          puts ""
          main_menu
        when "3"        # delete single recipe or all recipes (by recipe name)
          puts ""
          delete_recipe_menu_option
          puts ""
          main_menu
        when "4"        # print ingredients (ingredients only from all recipe instances)
          puts ""
          grocery_list_menu_option
          puts ""
          main_menu
        when "5" || "exit" || "Exit"
          puts ""
          puts "Goodbye. Enjoy your meal."
          puts ""
      end
    else
      puts ""
      puts "Please enter only 1, 2, 3, 4, or 5"
      puts ""
      main_menu
    end
  end

  def add_recipe_menu_option
    puts "If you know the recipe you want, enter its name. If not, enter 'browse'."
    puts "(You must enter the EXACT name to find a specific recipe.)"

    input = normalize(gets.strip)
    puts ""

    # if browse, call browse method, else use user input as recipe name to instantiate recipe object
    if input == "Browse" || input == "Find" || input == "Search" || input == "Lookup"
      browse("meal type")
    elsif Recipe.find_by_name(input)
      puts "You've already added that recipe."
      puts ""
    else
      get_recipe(input)
    end
  end

  def get_recipe(input)
    begin
      Recipe.new(input)
    rescue OpenURI::HTTPError
      puts "That recipe is not on Allrecipes.com. Please try another or browse."
      add_recipe_menu_option
    else
      puts "#{input} has been added to your recipes."
      puts ""
    end
  end

  def view_recipes_menu_option
    if Recipe.all.count == 0
      puts "You haven't added any recipes yet."
    else
      puts "Here are all your current recipes."
      puts Recipe.all_names
    end
  end

  def delete_recipe_menu_option
    count = Recipe.all.count
    if count == 0
      puts "You haven't added any recipes yet."
    else
      puts "Which recipe would you like to remove? (enter 1-#{count+2})"
      Recipe.all_names.each_with_index { |r, i| puts "#{i+1}. #{r}" }
      puts "#{count+1}. Delete ALL recipes."
      puts "#{count+2}. Nevermind. Go back."

      input = gets.strip.to_i
      item = Recipe.all_names[input-1]

      if input.between?(1, count)
        Recipe.delete(item)
        puts "#{item} has been removed."
      elsif input == count+1
        Recipe.delete_all
        puts "All recipes have been removed."
      elsif input == count+2
        puts "I like these too. Glad you're keeping them."
      else
        puts "That item is not on the list."
        delete_recipe_menu_option
      end
    end
  end

  def grocery_list_menu_option
    if Recipe.all.count == 0
      puts "You haven't added any recipes yet."
    else
      Recipe.all.each do |recipe|
        puts recipe.name
        puts recipe.items
        puts ""
      end
    end
  end

  def normalize(input)
    input.split.collect(&:capitalize).join(' ')
  end


    # need a meal type menu, list of meal types (i.e. main dishes, side dishes, breakfast, lunch, etc.) - make extendable
    # need main dish menu, list of main dishes (i.e. beef, chicken, vegetarian, etc.) - make extendable
    # need side dish menu, list of side dishes (i.e. vegetables, rice, potatoes, etc.) - make extendable
    # need recipe menu, list of all recipes use for delete menu

  # this will control the menu flow for categories
  def browse(name)
    get_menu(name)
  end

  def get_menu(name)
    Category.new(name) if !Category.all_names.include?(name)
    Category.find_by_name(name).menu
  end



end
