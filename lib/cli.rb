class CLI
  def main_menu
    puts "What would you like to do? (enter number)"
    puts "1. Add recipe"
    puts "2. View all recipes"
    puts "3. Delete one or all recipes"
    puts "4. Create grocery list"
    puts "5. Exit"
    puts ""

    input = gets.strip

    if input.to_i.between?(1,6)
      case input
        when "1"
          add_recipe_menu_option
          main_menu
        when "2"
          view_recipes_menu_option
          puts ""
          main_menu
        when "3"
          delete_recipe_menu_option
          puts ""
          main_menu
        when "4"
          grocery_list_menu_option
          puts ""
          main_menu
        when "5" || "exit" || "Exit"
          puts "Goodbye. Enjoy your meal."
      end
    else
      puts "Please enter only 1, 2, 3, 4, or 5"
      puts ""
      main_menu
    end
  end

  def add_recipe_menu_option
    puts "If you know the recipe you want, enter its name. If not, enter 'browse'."
    puts "    (You must enter the EXACT name to find a specific recipe.)"
    puts ""

    input = normalize(gets.strip)

    if input == "Browse" || input == "B" || input == "Find" || input == "Search" || input == "Lookup"
      browse("meal type")
    else
      get_recipe(input)
    end
  end

  def browse(name)
    Category.new(name) if !Category.all_names.include?(name)
    category = Category.find_by_name(name)
    selection = category.menu

    if selection == "bad input"
      browse(name)
    elsif category.parent == "main"
      browse(selection) if selection != "back"
    elsif category.parent == "meal type"
      selection == "back" ? browse(category.parent) : browse(selection)
    else
      selection == "back" ? browse(category.parent) : get_recipe(selection)
    end
  end

  def get_recipe(input)
    if Recipe.find_by_name(input)
      puts "You've already added that recipe."
      puts ""
    else
      begin
        Recipe.new(input)
      rescue OpenURI::HTTPError
        puts "That recipe is not on Allrecipes.com. Please try another or browse."
        puts ""
        add_recipe_menu_option
      else
        puts "#{input} has been added to your recipes."
        puts ""
      end
    end
  end

  def view_recipes_menu_option
    if no_recipes?
    else
      puts "Here are all your current recipes."
      puts Recipe.all_names
    end
  end

  def delete_recipe_menu_option
    if no_recipes?
    else
      count = Recipe.all.count

      puts "Which recipe would you like to remove? (enter 1-#{count+2})"
      Recipe.all_names.each_with_index { |r, i| puts "#{i+1}. #{r}" }
      puts "#{count+1}.    Delete ALL recipes."
      puts "#{count+2}.    Nevermind. Go back."
      puts ""

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
        puts ""
        delete_recipe_menu_option
      end
    end
  end

  def grocery_list_menu_option
    if no_recipes?
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

  def no_recipes?
    if Recipe.all.count == 0
      puts "You haven't added any recipes yet."
      true
    end
  end
end
