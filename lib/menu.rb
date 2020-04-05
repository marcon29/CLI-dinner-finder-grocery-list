  # may need to make so array is always from object

  # class creates menues
      # meal_type menu (menu of meal types: main or side dishes)
          # options = [hardcoded, but could be scraped from site]
      # category menu (menu of categories: beef, chicken, etc.)
          # options = [hardcoded, but could be scraped from site]
      # delete menu (menu of all added recipes)
          # # options = [hardcoded, but could be scraped from site]
  # has a name/type, options list, count

  # in CLI
      # if sub_menu exists, get it
      # if not create it (from a category instance)
  # in sub_menu
      # if category exists, get it
      # if category does not exist, create category
      # build menu from category (new or existing)

  # assigns variables for method (object options)
  # make so all except delete options = category.new(name)
      # name is category name
      # in category class @items changes based on name following logic below

class Menu
  attr_accessor :name, :options, :count

  @@all={}
  # then add other menu instances to create navigation

  def initialize(name)
    @name = name
    get_menu_options
    @count = @options.count
    @@all[@name] = @options
  end

  def self.all
    @@all
  end

  def get_menu_options
    if @name == "meal type"
      @options =  ["main dish", "side dish"]
    elsif @name == "main dish"
      @options =  ["beef", "chicken"]
    # elsif @name == "category"
    #   @options =  Category.new(@name).items
    # elsif @name == "delete"
    #   @options =  Recipe.all_instance_names
    end
  end

  # def self.all_names
  #   self.all.collect { |m| m.name }
  # end
  #
  # def self.find_by_name(name)
  #   self.all.detect { |m| m.name == name }
  # end

  def display
    puts "Choose a #{@name} recipe (enter 1-#{count+1})"
    options.each_with_index { |o, i| puts "#{i+1}. #{o.capitalize} recipes" }
    puts "#{count+1}. Nevermind. Go back."
  end
end

#   def execute
#     display
#
#     input = gets.strip.to_i
#     puts ""
#
#     if input.between?(1, count)
#       item = options[input-1]
#       # method_name(item)      # menu action/selection (different for every menu - create a method for each and call here)
#       # all_menus_array[current_index+1]
#       Menu.all[item]
#     elsif input == count+1
#       # main_dish_menu
#       # all_menus_array[current_index-1]
#       Menu.all[Menu.all.index(self)-1]
#     else
#       puts "That option is not on the list."
#       # all_menus_array[current_index]
#       Menu.all[Menu.all.index(self)]
#     end
#   end
#
#
# end
# type = Menu.new("meal type")
# dish = Menu.new("main dish")
