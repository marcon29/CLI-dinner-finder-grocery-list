#get_category,  main_dish_menu, delete recipe
def main_dish_menu
  main_dishes = ["beef", "chicken"]

  puts "Choose a main dish category (enter 1-#{main_dishes.count})"
  main_dishes.each_with_index { |md, i| puts "#{i+1}. #{md.capitalize} dishes" }

  input = gets.strip.to_i
  puts ""

  if input.between?(1, main_dishes.count)
    get_category(main_dishes[input-1])
  else
    puts "That item is not on the list."
    main_dish_menu
  end
end

def get_category(input)
    category = Category.new(input)
    count = category.items.count

    puts "Which #{input} recipe would you like to add? (enter 1-#{count+1})"
    category.items.each_with_index { |r, i| puts "#{i+1}. #{r}" }
    puts "#{count+1}. Nevermind. Go back."

    input = gets.strip.to_i
    item = category.items[input-1]
    puts ""

    if input.between?(1, count)
      get_recipe(item)
    elsif input == count+1
      puts "Yeah, let's look at something else."
      main_dish_menu
    else
      puts "That item is not on the list."
      get_category(input)
    end
end



def delete_recipe_menu_option
  count = Recipe.all.count
  if count == 0
    puts "You haven't added any recipes yet."
  else
    puts "Which recipe would you like to remove? (enter 1-#{count+2})"
    Recipe.all_instance_names.each_with_index { |r, i| puts "#{i+1}. #{r}" }
    puts "#{count+1}. Delete All"
    puts "#{count+2}. Nevermind. Go back."

    input = gets.strip.to_i
    item = Recipe.all_instance_names[input-1]

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


class Category < PageType
  # make base url variable???
  # full: https://www.allrecipes.com/recipes/main-dish/beef/
      #veg: https://www.allrecipes.com/recipes/everyday-cooking/vegetarian/main-dishes/
  # base: https://www.allrecipes.com/recipes/
  # meal type: main-dish/
      #veg: everyday-cooking/vegetarian/main-dishes/
  # category: beef/
  # base << meal type << category <<

  @@all = []

  def initialize(name)
    super
    @items = Scraper.scrape_category(create_url)
    @@all << self
  end

  # converts meal type and category names to url
  def create_url
    "https://www.allrecipes.com/recipes/main-dish/" << slug
  end

  def self.all
    @@all
  end
end
