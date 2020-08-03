class APIService

  BASE_URI = "https://api.edamam.com/search"

  def fetch_recipes_by_item(item)
    url = URI(BASE_URI + "?q=tofu&ingr=5&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["API_KEY"]}")
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    puts "response= #{response}"
  end

  # def init_url(index_url)
  #   recipes_array = []
  #   url = "https://api.edamam.com/search?q=tofu&ingr=5&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["API_KEY"]}"
  #   uri = URI.parse(url)
  #   response = Net::HTTP.get_response(uri)
  #   recipe_list = JSON.parse(response.body)

#     require 'open-uri'
#     require 'net/http'
#     url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"
#     uri = URI.parse(url)
#     response = Net::HTTP.get_response(uri)
#     response.body
#
# recipes["hits"][0]["recipe"]["label"] <------ to get to the label
# this after setting the var recipes to JSON.parse(response_body)
# recipes["hits"][1]["recipe"]["label"]
#  recipes["hits"][1]["recipe"]["ingredientLines"] <--- ingredients


end
