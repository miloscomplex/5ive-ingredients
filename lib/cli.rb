class CLI

  def new_line
    puts "\n"
  end

  def run
    system("clear")
    @user_input = nil
    @api = APIService.new
    # @page = 1
    welcome

    until @user_input == "q"
      main_menu
    end
    puts "\n\n"
    puts "Goodbye!"
    puts "\n"
  end

  def welcome
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +".colorize(:color => :yellow)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +".colorize(:color => :cyan)
    puts "+ - - - - -  WELCOME TO 5IVE RECIPE FINDER  - - - - - +".colorize(:color => :yellow)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +".colorize(:color => :cyan)
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + +".colorize(:color => :yellow)
    2.times { new_line }
  end

  def main_menu
    puts ""
    puts "Select your protein or vegetarian"
    puts "1. Beef, 2. Chicken, 3. Pork, 4. Fish, 5. Tofu"

    @user_input = gets.chomp

    if @user_input == "1"
      search_for_recipe("beef")
    elsif @user_input == "2"
      search_for_recipe("chicken")
    elsif @user_input == "3"
      search_for_recipe("pork")
    elsif @user_input == "4"
      search_for_recipe("fish")
    elsif @user_input == "5"
      search_for_recipe("tofu")
    elsif @user_input == "q"
      "\n"
    else
      puts "Invalid input".colorize(:red)
    end

  end

  def search_for_recipe(item)
    system("clear")
    puts "\n"
    puts "+ + + + ------ Here are your recipes for #{item} ----- + + + +"
    puts "\n"
    # recipes_hash is the hash of the query
    recipes_hash = @api.fetch_recipes_by_item(item)
    # create new Recipes instance

    # .each to seperate recipes
    recipes = Recipe.new #(recipes_hash)

    # returns the labels for the recipes
    recipes.list_recipes(recipes_hash)

    puts "\nWhich recipe (1-10) do you wish to see?"
    input = gets.chomp
    recipes.see_recipe(input, recipes_hash)
    2.times {new_line}
    puts "See website (w), Return to results (r), Start a new search (n)?"
    input = gets.chomp
    Case input
    if input == "n"
      main_menu
    elsif input == "r"
      recipes.list_recipes(recipes_hash)
    elsif input == "w"
      # system("open")
      puts "I need to figure that out"
    end
    # if input == ("1".."10")
    #   recipes.see_recipe(input, recipes_hash)
    # else
    #   puts "Invalid input".colorize(:red)
    # end

  end


end
