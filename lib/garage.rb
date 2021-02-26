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

    all_cars = customers.map do |customer|  # or use #flat_map and don't need flatten below
      customer.cars
    end.flatten
    all_cars #= all_cars.flatten
  end

  def cars_by_make
    grouped_by_make = {}
    all_cars.each do |car|
      grouped_by_make[car.make] = [] if grouped_by_make[car.make].nil?
      grouped_by_make[car.make] << car

      # VS

      if grouped_by_make[car.make].nil?
        grouped_by_make[car.make] = [car]
      else
        grouped_by_make[car.make] << car
      end

      # VS group_by
      # group_by => always to make a hash of keys/in_block and value/arrays of elements iterating over
      # all_cars.group_by do |car|
      #   car.make
    end
    grouped_by_make
  end

  def oldest_cars
    oldest = all_cars.sort_by do |car|
      car.age
    end.reverse
    oldest[0, 3] # or [0..2]

    # all_cars.max_by(3) do |car|  <-- another solution
    #   car.age
    # end
  end

# ITERATION 4 ----------------------------
  def owner_of_oldest_car
    old_car = oldest_cars.first
    @customers.find do |customer|
      customer.cars.include?(old_car)
    end.name
  end

  def cars_in_range(range)
    all_cars.find_all do |car|
      range.include?(car.year.to_i)
    end
  end
end
