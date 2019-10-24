class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [ :index,:show]
  #before_action :check_is_admin, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    if params[:search]
      @restaurants=Restaurant.where('name LIKE ?',"%#{params[:search]}%")
    else
    @restaurants = Restaurant.all
  end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant=Restaurant.find(params[:id])
    #@phone=Phone.find(params[:id])
    @cuisine=Cuisine.find(params[:id])
    @review=Review.new
  end

  # GET /restaurants/new
  def new
    @restaurant=Restaurant.new
    @phone=Phone.new
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant= Restaurant.find(params[:id])
    @cuisine=Cuisine.find(params[:id])
   # @phone=Phone.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :city_id, :location_id, :address, :cost_avg,:delivery_facility,cuisine_ids:[])
    end
end
