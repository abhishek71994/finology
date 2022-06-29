class Api::V1::CarsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    query_params = request.query_parameters
    type = query_params[:type]
    if type.present?
      @cars = Car.where(car_type: type)
    else
      @cars = Car.all
    end
    render json: @cars
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car
    else
      render error: { error: 'Unable to create car' }, status: 400
    end
  end

  def update

  end

  private

  def car_params
    params.require(:car).permit(:car_type, :car_model, :car_variant, :car_year)
  end
end
