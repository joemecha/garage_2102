require './lib/car'

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
    array = car_title.split
    info[:year] = array[0]
    info[:description] = array[1..3].join(" ")

    car = Car.new(info) # BIG CHANGE HERE MAKES TESTING EASIER CAN ASSIGN VARIABLE NAMES TO TEST 
    @cars << car

  end

  def vintage_cars
    @cars.find_all do |car|
      car.age >= 25
    end
  end
end
