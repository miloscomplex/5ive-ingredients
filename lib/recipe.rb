 class Recipe
   @@all = []

   attr_accessor :name, :recipe_details

   def initialize(name, recipe_details)
     @name = name
     @recipe_details = recipe_details
     @@all << self
   end

   def self.all
     @@all
   end

   # should this be called for pagination?
   def input_to_index(input)
     index = input.to_i - 1
   end

   def self.clear_all
     @@all.clear
   end

   # def list_recipes(recipes_hash)
   #   recipe_labels = recipes_hash["hits"].collect do |recipe|
   #     recipe["recipe"]["label"]
   #   end
   #   # neat trick use .with_index(1) to avoid index + 1
   #   recipe_labels.each.with_index(1) {|label, index | puts "#{index}. #{label}" }
   # end

   # This class will talk to the bin file and display initially the recipe name
   # and if clicked the recipe details

   def see_recipe(input, recipes_hash)
     input = input_to_index(input)
     system("clear")
     puts recipes_hash["hits"][input]["recipe"]["label"].upcase
     puts "\n"
     print recipes_hash["hits"][input]["recipe"]["ingredientLines"].join(",").gsub(",","\n\n")
     puts "\n\n----------------------------"
     puts "See step by step details at:"
     url = recipes_hash["hits"][input]["recipe"]["url"]
     puts url
     url
   end

 end
