class Garage
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(owner)
    @customers << owner
  end

  def all_cars
    # require "pry"; binding.pry
    # customers.each do |owner|
    #   owner.cars.each do |car| <--- Originally missed a period here!!!
    #     @all_the_cars << car
    #   end
    # end

    all_cars = customers.map do |customer|
      customer.cars
    end
    all_cars = all_cars.flatten
  end

  def cars_by_make
    makes = {}
    all = all_cars
    all.each do |car|
      if makes[car.make].nil?
        makes[car.make] = [car]
      else
        makes[car.make] << car
      end
    end
    makes
  end

  def oldest_cars
    all = all_cars
    oldest = all.sort_by do |car|
      car.age
    end
    oldest = oldest.reverse
    oldest[0, 3]
  end
end
