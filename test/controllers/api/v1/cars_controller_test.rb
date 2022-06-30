require "test_helper"

class Api::V1::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should not save car without car_type" do
    car = Car.new
    assert_not car.save
  end

  test "should save car with details" do
    car = Car.new(:car_type => 'electric', :car_model => 'tesla', :car_variant => 'S', :car_year => 2019)
    assert car.save
  end

  test "should save car with details in the database" do
    car = Car.new(:car_type => 'electric', :car_model => 'tesla', :car_variant => 'S', :car_year => 2019)
    car.save
    car_db =  Car.where(:car_type => 'electric').first()
    assert_equal(car[:car_model], car_db[:car_model])
  end
end
