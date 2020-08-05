 class Recipe
   @@all = []

   attr_accessor :name, :recipe_details, :url

   def initialize(name, recipe_details, url)
     @name = name
     @recipe_details = recipe_details
     @url = url
     @@all << self
   end

   def self.all
     @@all
   end

   def self.clear_all
     @@all.clear
   end

 end
