class APIService

  BASE_URI = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  API_KEY = ENV["API_KEY"]

  def fetch_recipes_by_item(item)
    uri = URI(BASE_URI + "?q=#{item}&ingr=5&app_id=#{APP_ID}&app_key=#{API_KEY}")
    response = Net::HTTP.get_response(uri)
    recipes_list = JSON.parse(response.body)
    # recipes_list["hits"][0]["recipe"]["label"]
    # puts "response= #{response}"
    puts ""
    recipes = Recipe.new
    recipes.list_recipes(recipes_list)

  end

end
