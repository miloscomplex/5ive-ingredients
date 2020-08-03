class CLI

  def run
    system("clear")
    @user_input = nil
    @api = APIService.new
    @page = 1
    welcome

    until @user_input == "exit"
      main_menu
    end
    puts "Goodbye!"
  end

  def welcome
    puts "////////-----Welcome to 5ive Recipe Finder-------////////".colorize(:orange)
    "\n"
  end

  def main_menu
    puts "Select your protein or vegetarian"
    puts "1. Beef, 2. Chicken, 3. Pork, 4. Fish 5. Vegetarian"

    @user_input = gets.chomp

    if @user_input == "1"
      puts "you choose beef"
    elsif @user_input == "2"
      puts "you choose chicken"
    elsif @user_input == "3"
      puts "you choose pork"
    elsif @user_input == "4"
      puts "you choose fish"
    elsif @user_input == "5"
      puts "you choose vegetarian is this correct?"
    elsif @user_input == "exit"
      "/b"
    else
      puts "Invalid input".colorize(:red)
    end

  end


end
