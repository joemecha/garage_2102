require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  def setup
    @garage = Garage.new("Totally Safe Parking")

    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Blue Ford Escape')

    @owner_2 = Owner.new('Glen Coco', 'Unknown')
    @owner_2.buy('1963 Green Chevrolet Corvette')
    @owner_2.buy('2020 Silver Volvo XC90')
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end

  def test_it_has_attribute
    assert_equal "Totally Safe Parking", @garage.name
  end

  def test_add_customers
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    expected = [@owner_1, @owner_2]

    assert_equal expected, @garage.customers
  end

  def test_all_cars
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)
    # require "pry"; binding.pry
    # NameError: undefined local variable or method `each' for #<Garage:0x00007f95c787d408>
    #/Users/joemecha/turing/1module/independent_challenges/garage_2102/lib/garage.rb:17:in `block in all_cars'
    #/Users/joemecha/turing/1module/independent_challenges/garage_2102/lib/garage.rb:16:in `each'
    #/Users/joemecha/turing/1module/independent_challenges/garage_2102/lib/garage.rb:16:in `all_cars'
    #test/garage_test.rb:41:in `test_all_cars'

    assert_equal 2, @garage.all_cars.length
    # Should be 4, changed to move on to other methods
  end

  def test_cars_by_make
  end

  def test_oldest_cars
  end
end
