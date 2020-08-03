class UrlRequest

  path = "https://api.edamam.com/search"

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def init_url(index_url)
    recipes_array = []
    url = "https://api.edamam.com/search?q=tofu&ingr=5&app_id=ad1706ff&from=10&to=20&app_key=7a10c431116ae20e1c8e3834302aeeeb"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    recipe_list = JSON.parse(response.body)

#     require 'open-uri'
#     require 'net/http'
#     url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"
#     uri = URI.parse(url)
#     response = Net::HTTP.get_response(uri)
#     response.body

recipes["hits"][0]["recipe"]["label"] <------ to get to the label
this after setting the var recipes to JSON.parse(response_body)
recipes["hits"][1]["recipe"]["label"]
 recipes["hits"][1]["recipe"]["ingredientLines"] <--- ingredients

# JSON.parse(response.body)

# Aside: If you'd like a better view of this data, require awesome_print and
# then try typing ap JSON.parse(response.body) to see a better output.

    # will return JSON
    # within in "hits" = are all the recipes return
    # capture the data name and recipe details

    def get_recipe

    end

  end
end
