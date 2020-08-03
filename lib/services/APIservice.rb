require 'open-uri'
require 'net/http'


class APIService

  BASE_URI = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  API_KEY = ENV["API_KEY"]

  def fetch_recipes_by_item(item)
    uri = URI(BASE_URI + "?q=beef&ingr=5&app_id=#{APP_ID}&app_key=#{API_KEY}")
    response = Net::HTTP.get_response(uri)
    recipes_list = JSON.parse(response.body)
    # recipes_list["hits"][0]["recipe"]["label"]
    recipes_list["q"]
    puts "response= #{response}"
    puts ""
    recipe_labels = recipes_list["hits"].collect do |recipe|
      recipe["recipe"]["label"]
    end

    recipe_labels.each_with_index {|label, index | puts "#{index}. #{label}" }

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
