class CLI

  def new_line
    puts "\n"
  end

  def run
    system("clear")
    @user_input = nil
    @protein_selection = nil
    @api = APIService.new
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
    new_line
    main_menu
  end

  def main_menu
    new_line
    puts "SELECT YOUR PROTEIN"
    new_line
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
        invalid_input
    end

  end

  def search_for_recipes(item)
    @protein_selection = item
    recipes_hash = @api.fetch_recipes_by_item(item)

    # create new Recipe class instance
    recipes_hash["hits"].each do |recipe|
      name = recipe["recipe"]["label"]
      recipe_details = recipe["recipe"]["ingredientLines"]
      url = recipe["recipe"]["url"]
      recipe = Recipe.new(name, recipe_details, url)
    end

    display_recipes

  end

  def display_recipes
    system("clear")
    puts "\n"
    puts "+ + + + ------ Here are your recipes for #{@protein_selection} ----- + + + +"
    puts "\n"

    Recipe.all.each.with_index(1) do |recipe, index |
      puts "#{index}. #{recipe.name}"
    end

    puts "\nWhich recipe (1-#{Recipe.all.length}) do you wish to see?"

    @user_input = gets.chomp
    # non-numbers such as "Hi" = 0
    # @user_input = input_to_index(@user_input)
    if (1..Recipe.all.length) === @user_input.to_i
      display_recipe_details
    else
      display_recipes
    end
  end

  def display_recipe_details
    input = input_to_index(@user_input)
    details = Recipe.all[input]
    #find the recipe details by index
    system("clear")

    puts details.name.upcase
    new_line
    puts details.recipe_details

    2.times {new_line}
    puts "----------------------------"
    puts "See step by step details at:"
    puts details.url
    2.times {new_line}
    puts "See website (w), Return to results (r), Start a new search (n), or quit (q)?"

    # Case input
    input = gets.chomp
    case input
      when "w"
        Launchy.open(details.url)
        display_recipe_details
      when "n"
        run
      when "r"
        display_recipes
      when "q"
        exit
      else
        invalid_input
        display_recipe_details
    end
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def invalid_input
    puts ">>Invalid input".colorize(:red)
  end


end
