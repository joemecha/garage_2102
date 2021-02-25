class Garage
  attr_reader :name,
              :owners

  def initialize(name)
    @name = name
    @owners = []
  end

end 
