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

    2.times {new_line}
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
    puts "\n"
    puts "Select your protein"
    puts "1. Beef, 2. Chicken, 3. Pork, 4. Fish, 5. Tofu"

    @user_input = gets.chomp

    case @user_input
    when "1"
      search_for_recipes("beef")
    when "2"
      search_for_recipes("chicken")
    when "3"
      search_for_recipes("pork")
    when "4"
      search_for_recipes("fish")
    when "5"
      search_for_recipes("tofu")
    when "q"
      "\n"
    else
      puts "Invalid input".colorize(:red)
    end

  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def search_for_recipes(item)
    system("clear")
    recipes_hash = @api.fetch_recipes_by_item(item)

    # create new Recipe class instance
    recipes_hash["hits"].each do |recipe|
      name = recipe["recipe"]["label"]
      recipe_details = recipe["recipe"]["ingredientLines"]
      recipe = Recipe.new(name, recipe_details)
    end

    display_recipes(item)

  end

  def display_recipes(item)
    puts "\n"
    puts "+ + + + ------ Here are your recipes for #{item} ----- + + + +"
    puts "\n"

    Recipe.all.each.with_index(1) do |recipe, index |
      puts "#{index}. #{recipe.name}"
    end

    puts "\nWhich recipe (1-#{Recipe.all.length}) do you wish to see?"

    @user_input = gets.chomp
    # non-numbers such as "Hi" = 0
    # @user_input = input_to_index(@user_input)
    if (1..Recipe.all.length) === @user_input.to_i
      display_recipe_details(@user_input)
    end
  end

  def display_recipe_details(input)

    input = input_to_index(input)
    puts Recipe.all[input].recipe_details
    binding.pry
    # recipes.see_recipe(input, recipes_hash)
    2.times {new_line}
    puts "See website (w), Return to results (r), Start a new search (n)?"
    input = gets.chomp
    # Case input
    if input == "n"
      main_menu
    elsif input == "r"
      recipes.list_recipes(recipes_hash)
    elsif input == "w"
      # system("open")
      puts "I need to figure that out"
    end

  end


end
