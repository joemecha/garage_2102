class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car_title)
    info = {}
    array = car_title.split(" ")
    info[:year] = array[0]
    info[:description] = array[1] + " " + array[2] + " " + array[3]
    @cars << Car.new(info)
  end

  def vintage_cars
    @cars.find_all do |car|
      car.age >= 25
    end
  end
end
