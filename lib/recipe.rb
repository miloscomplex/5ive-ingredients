 class Recipe
   # should this be called for pagination?
   attr_accessor :recipe, recipe_url
   def initialize(name)
     @name = name
   end

   # This class will talk to the bin file and display initially the recipe name
   # and if clicked the recipe details
   def list_recipe_names(recipe_name, num)
     # display a list of 10 recipes for the user to select from
   end

   def recipe_details(recipe_name, recipe)
     # display the details of the recipe
   end


 end
