class RestaurantCuisinesController < ApplicationController
  
  before_action :authenticate_user!, except: [ :index,:show]
  #before_action :check_is_admin, except: [:index, :show,:new,:edit]
  before_action :set_restaurant_cuisine, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_cuisines
  # GET /restaurant_cuisines.json
  def index
    @restaurant_cuisines = RestaurantCuisine.all
  end

  # GET /restaurant_cuisines/1
  # GET /restaurant_cuisines/1.json
  def show
    @restaurant_cuisines=RestaurantCuisine.find(params[:id])
  end

  # GET /restaurant_cuisines/new
  def new
    @restaurant_cuisine = RestaurantCuisine.new
  end

  # GET /restaurant_cuisines/1/edit
  def edit
     @restaurant_cuisines=RestaurantCuisine.find(params[:id])
  end

  # POST /restaurant_cuisines
  # POST /restaurant_cuisines.json
  def create
    @restaurant_cuisine = RestaurantCuisine.new(restaurant_cuisine_params)

    respond_to do |format|
      if @restaurant_cuisine.save
        format.html { redirect_to @restaurant_cuisine, notice: 'Restaurant cuisine was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_cuisine }
      else
        format.html { render :new }
        format.json { render json: @restaurant_cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_cuisines/1
  # PATCH/PUT /restaurant_cuisines/1.json
  def update
    respond_to do |format|
      if @restaurant_cuisine.update(restaurant_cuisine_params)
        format.html { redirect_to @restaurant_cuisine, notice: 'Restaurant cuisine was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_cuisine }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_cuisines/1
  # DELETE /restaurant_cuisines/1.json
  def destroy
    @restaurant_cuisine.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_cuisines_url, notice: 'Restaurant cuisine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_cuisine
      @restaurant_cuisine = RestaurantCuisine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_cuisine_params
      params.require(:restaurant_cuisine).permit(:restaurant_id, :cuisine_id)
    end
end
