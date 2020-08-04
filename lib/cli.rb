class CLI

  def run
    system("clear")
    @user_input = nil
    @api = APIService.new
    @page = 1
    welcome

    until @user_input == "q"
      main_menu
    end
    puts "\n\n"
    puts "Goodbye!"
    puts "\n"
  end

  def welcome
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +"#.colorize(:color => :light_blue)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +"#.colorize(:color => :light_blue)
    puts "+ - - - - -  WELCOME TO 5IVE RECIPE FINDER  - - - - - +"#.colorize(:color => :light_blue)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +"#.colorize(:color => :light_blue)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +"#.colorize(:color => :light_blue)
    "\n"
  end

  def main_menu
    puts ""
    puts "Select your protein or vegetarian"
    puts "1. Beef, 2. Chicken, 3. Pork, 4. Fish, 5. Tofu"

    @user_input = gets.chomp

    if @user_input == "1"
      puts "you choose beef"
      # retrive beef recipes
      # will contain in hash recipe details
      search_for_recipe("beef")
    elsif @user_input == "2"
      puts "you choose chicken"
      search_for_recipe("chicken")
    elsif @user_input == "3"
      puts "you choose pork"
      search_for_recipe("pork")
    elsif @user_input == "4"
      puts "you choose fish"
      search_for_recipe("fish")
    elsif @user_input == "5"
      puts "you choose tofu"
      search_for_recipe("tofu")
    elsif @user_input == "q"
      "\n"
    else
      puts "Invalid input".colorize(:red)
    end
  end

  def search_for_recipe(item)
    system("clear")
    puts ""
    puts "+ + + + ------ Here are your recipes ----- + + + +"
    puts ""
    # recipes_hash is the hash of the query
    recipes_hash = @api.fetch_recipes_by_item(item)
    # create new Recipes instance
    recipes = Recipe.new
    # returns the labels for the recipes
    recipes.list_recipes(recipes_hash)

    puts "\nWhich recipe (1-10) do you wish to see?"
    input = gets.chomp
    recipes.see_recipe(input, recipes_hash)
    puts "\n\n"
    puts "Return to results (r) or Start a new search (n)?"
    input = gets.chomp
    if input == "n"
      main_menu
    end
    # if input == ("1".."10")
    #   recipes.see_recipe(input, recipes_hash)
    # else
    #   puts "Invalid input".colorize(:red)
    # end

  end


end
