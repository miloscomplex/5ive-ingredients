 class Recipe


   # should this be called for pagination?
   def input_to_index(input)
     index = input.to_i - 1
   end

   def list_recipes(recipes_hash)
     recipe_labels = recipes_hash["hits"].collect do |recipe|
       recipe["recipe"]["label"]
     end
     recipe_labels.each_with_index {|label, index | puts "#{index + 1}. #{label}" }
   end

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
     puts recipes_hash["hits"][input]["recipe"]["url"]
   end

 end
