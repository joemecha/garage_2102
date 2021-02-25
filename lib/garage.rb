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
    everything = customers.map do |customer, car|
      customer.cars
    end

    # require "pry"; binding.pry
    # @customers.each do |owner| <-- ERROR
    #   owner.cars each do |car|
    #     all_cars << car
    #   end
    # end
  end

  def cars_by_make
  end

  def oldest_cars
  end
end
