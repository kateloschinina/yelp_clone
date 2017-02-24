class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.user_id != @user.id
      flash[:notice] = 'You are not permitted'
      redirect_to '/restaurants'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
  end

  def destroy
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.user_id == @user.id
      @restaurant.destroy
      flash[:notice] = 'Restaurant deleted successfully'
    else
      flash[:notice] = 'You are not permitted'
    end
    redirect_to'/restaurants'
  end


private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end


end
