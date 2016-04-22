class StreetFoodsController < ApplicationController
  before_action :set_street_food, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:search, :index, :show]

  def search
    if params[:search].present?
      @street_foods = StreetFood.search(params[:search])
    else
      @street_foods = StreetFood.all
    end
  end

  # GET /street_foods
  # GET /street_foods.json
  def index
    @street_foods = StreetFood.all
  end

  # GET /street_foods/1
  # GET /street_foods/1.json
  def show
	@street_food = StreetFood.find(params[:id])
	@reviews = @street_food.reviews
    if @reviews.blank?
        @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /street_foods/new
  def new
    @street_food = StreetFood.new
  end

  # GET /street_foods/1/edit
  def edit
  end

  # POST /street_foods
  # POST /street_foods.json
  def create
    @street_food = StreetFood.new(street_food_params)

    respond_to do |format|
      if @street_food.save
        format.html { redirect_to @street_food, notice: 'Street food was successfully created.' }
        format.json { render :show, status: :created, location: @street_food }
      else
        format.html { render :new }
        format.json { render json: @street_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /street_foods/1
  # PATCH/PUT /street_foods/1.json
  def update
    respond_to do |format|
      if @street_food.update(street_food_params)
        format.html { redirect_to @street_food, notice: 'Street food was successfully updated.' }
        format.json { render :show, status: :ok, location: @street_food }
      else
        format.html { render :edit }
        format.json { render json: @street_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @street_food.upvote_by current_user
    redirect_to @street_food
    end
    
  def downvote
    @street_food.downvote_by current_user
    redirect_to @street_food
    end

  # DELETE /street_foods/1
  # DELETE /street_foods/1.json
  def destroy
    @street_food.destroy
    respond_to do |format|
      format.html { redirect_to street_foods_url, notice: 'Street food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street_food
      @street_food = StreetFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def street_food_params
      params.require(:street_food).permit(:name, :address, :streetfoods)
    end
end
