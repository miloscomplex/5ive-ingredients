 class Recipe
   @@all = []

   attr_accessor :name, :recipe_details, :url, :health_labels

   def initialize(name, recipe_details, health_labels, url)
     @name = name
     @recipe_details = recipe_details
     @health_labels = health_labels
     @url = url
     @@all << self
   end

   def self.peanut_free
     recipe_array = []
     @@all.select do |recipe|
      recipe.health_labels.include?("Peanut-Free")
    end
   end

   def self.all
     @@all
   end

   def self.clear_all
     @@all.clear
   end

   def self.parse_details(array)
     array.collect do |a|
       a.gsub(/\n\s/,"\n").gsub(/\s{2,}/,"\s-\s").gsub(/\s,/,",").gsub(/--\s/,"")
     end
   end

end
