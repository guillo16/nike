class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurants, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
    @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    authorize @restaurant
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save == true
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
    @restaurant.update(restaurants_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
    flash[:notice] = "Your restaurant has been removed"
    authorize @restaurant
  end

  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :photo1, :photo2, :photo3, :category, :address, :description)
  end
end
