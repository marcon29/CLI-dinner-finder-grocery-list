class CLI
  # need to exit at any time

  # need main menu
  def main_menu
    puts "What would you like to do? (enter number)"
    puts "1. Add recipe"
    puts "2. View all recipes"
    puts "3. Delete a single recipe"
    puts "4. Delete all recipes"
    puts "5. Create grocery list"
    puts "6. Exit"

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
        when "4"        # delete all recipes
          delete_all_recipes_menu_option
          puts ""
          main_menu
        when "5"        # print ingredients (ingredients only from all recipe instances)
          puts ""
          grocery_list_menu_option
          puts ""
          main_menu
        when "6" || "exit" || "Exit"
          puts ""
          puts "Goodbye. Enjoy your meal."
          puts ""
      end
    else
      puts ""
      puts "Please enter only 1, 2, 3, 4, 5 or 6"
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
      main_dish_menu("main dish")
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
      puts Recipe.all_instance_names
    end
  end

  def delete_recipe_menu_option
    count = Recipe.all.count
    if count == 0
      puts "You haven't added any recipes yet."
    else
      puts "Which recipe would you like to remove? (enter 1-#{count+1})"
      Recipe.all_instance_names.each_with_index { |r, i| puts "#{i+1}. #{r}" }
      puts "#{count+1}. Nevermind. Go back."

      input = gets.strip.to_i
      item = Recipe.all_instance_names[input-1]

      if input.between?(1, count)
        Recipe.delete(item)
        puts "#{item} has been removed."
      elsif input == count+1
        puts "I like these too. Glad you're keeping them."
      else
        puts "That item is not on the list."
        delete_recipe_menu_option
      end
    end
  end

  def delete_all_recipes_menu_option
    if Recipe.all.count == 0
      puts "You haven't added any recipes yet."
    else
      Recipe.delete_all
      puts "All recipes have been removed."
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


      # if browse
          # main or side? (make array so can add more later - see above meal type menu?)
          # display applicable menu: main dish menu or side dish menu (all category options)
          # get category selection
              # user input, returns category name
              # instantiate category object using name
          # print recipe options for category
          # user selects recipe (loop back to getting recipe name above)

    # need a meal type menu, list of meal types (i.e. main dishes, side dishes, breakfast, lunch, etc.) - make extendable
    # def meal_type_menu
    #   meal_types = ["main dishes", "side dishes"]
    #
    #   puts "Choose a meal type (enter number)"
    #   meal_types.each_with_index { |mt, i| puts "#{i+1}. #{mt.capitalize} dishes" }
    # end

    # need main dish menu, list of main dishes (i.e. beef, chicken, vegetarian, etc.) - make extendable
    # need side dish menu, list of side dishes (i.e. vegetables, rice, potatoes, etc.) - make extendable
    def main_dish_menu(menu_type)
      category = Category.new(menu_type)
      options = category.items
      count = options.count

      puts "Choose a #{menu_type} recipe (enter 1-#{count+1})"
      options.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
      puts "#{count+1}. Nevermind. Go back."

      input = gets.strip.to_i
      puts ""

      if input.between?(1, count)
        item = options[input-1]
        get_category(item)
      elsif input == count+1
        puts "Yeah, let's look at something else."
        main_menu
      else
        puts "That item is not on the list."
        main_dish_menu(menu_type)
      end
    end

    def get_menu(name)
      if Menu.all_names.include?(name)
        # Menu.execute
      else
        Menu.new(name)
        # Menu.execute
      end
    end

    def get_category(menu_type)
      category = Category.new(menu_type)
      options = category.items
      count = options.count

      puts "Choose a #{menu_type} recipe (enter 1-#{count+1})"
      options.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
      puts "#{count+1}. Nevermind. Go back."

      input = gets.strip.to_i
      puts ""

      if input.between?(1, count)
        item = options[input-1]
        get_recipe(item) # changes - needs to move to different menu
      elsif input == count+1
        puts "Yeah, let's look at something else."
        main_dish_menu("main dish") # changes - needs to move to different menu
      else
        puts "That item is not on the list."
        get_category(menu_type) # changes - needs to move to different menu
      end
  end



end
