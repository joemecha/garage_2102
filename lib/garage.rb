class Garage
  attr_reader :name,
              :customers,
              :all_cars

  def initialize(name)
    @name = name
    @customers = []
    @all_cars = []
  end

  def add_customer(owner)
    @customers << owner
  end

  def all_cars
    # require "pry"; binding.pry
    # customers.each do |owner| <-- ERROR
    #   owner.cars each do |car|
    #     @all_the_cars << car
    #   end
    # end

    @all_cars = customers.map do |customer|
      customer.cars
    end
    @all_cars = @all_cars.flatten
  end

  def cars_by_make
    #out of time here
    @all_cars
  end
end
