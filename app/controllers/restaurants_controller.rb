class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurants, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    @restaurant.user = current_user
    if @restaurant.save == true
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :photo1, :photo2, :photo3, :category)
  end
end
