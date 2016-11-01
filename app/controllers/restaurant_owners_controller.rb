class RestaurantOwnersController < ApplicationController
  before_action :set_restaurant_owner, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_owners
  # GET /restaurant_owners.json
  def index
    @restaurant_owners = RestaurantOwner.all
  end

  # GET /restaurant_owners/1
  # GET /restaurant_owners/1.json
  def show
  end

  # GET /restaurant_owners/new
  def new
    @restaurant_owner = RestaurantOwner.new
  end

  # GET /restaurant_owners/1/edit
  def edit
  end

  # POST /restaurant_owners
  # POST /restaurant_owners.json
  def create
    @restaurant_owner = RestaurantOwner.new(restaurant_owner_params)

    respond_to do |format|
      if @restaurant_owner.save
        format.html { redirect_to @restaurant_owner, notice: 'Restaurant owner was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_owner }
      else
        format.html { render :new }
        format.json { render json: @restaurant_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_owners/1
  # PATCH/PUT /restaurant_owners/1.json
  def update
    respond_to do |format|
      if @restaurant_owner.update(restaurant_owner_params)
        format.html { redirect_to @restaurant_owner, notice: 'Restaurant owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_owner }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_owners/1
  # DELETE /restaurant_owners/1.json
  def destroy
    @restaurant_owner.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_owners_url, notice: 'Restaurant owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_owner
      @restaurant_owner = RestaurantOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_owner_params
      params.require(:restaurant_owner).permit(:restaurant_id, :user_id)
    end
end
