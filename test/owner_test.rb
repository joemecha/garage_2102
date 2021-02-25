require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'

class OwnerTest < Minitest::Test
  def setup
    @owner_1 = Owner.new('Regina George', 'Heiress')
  end

  def test_it_exists
    assert_instance_of Owner, @owner_1
  end

  def test_it_has_attributes
    assert_equal "Regina George", @owner_1.name
    assert_equal "Heiress", @owner_1.occupation
  end

  def test_starts_with_no_cars
    assert_equal [], @owner_1.cars
  end

  def test_buy_car
    @owner_1.buy('1967 Green Ford Mustang')

    assert_equal 1, @owner_1.cars.length

    @owner_1.buy('2001 Silver BMW 3-Series')
    @owner_1.buy('1963 Red Chevrolet Corvette')

    assert_equal 3, @owner_1.cars.length
  end

  def test_vintage_cars
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Silver BMW 3-Series')
    @owner_1.buy('1963 Red Chevrolet Corvette')

    assert_equal 2, @owner_1.vintage_cars.length
  end
end
