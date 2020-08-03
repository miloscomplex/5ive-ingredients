class UrlRequest

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def init_url(index_url)
    recipes_array = []
    doc = Nokogiri::HTML(open(index_url))
    # will return JSON
    # within in "hits" = are all the recipes return
    # capture the data name and recipe details
    

  end
end
