class DeliveryLocationsController < ApplicationController
  before_action :set_delivery_location, only: [:show, :edit, :update, :destroy]

  # GET /delivery_locations
  # GET /delivery_locations.json
  def index
    @delivery_locations = DeliveryLocation.all
  end

  # GET /delivery_locations/1
  # GET /delivery_locations/1.json
  def show
  end

  # GET /delivery_locations/new
  def new
    @delivery_location = DeliveryLocation.new
  end

  # GET /delivery_locations/1/edit
  def edit
  end

  # POST /delivery_locations
  # POST /delivery_locations.json
  def create
    @delivery_location = DeliveryLocation.new(delivery_location_params)

    respond_to do |format|
      if @delivery_location.save
        format.html { redirect_to @delivery_location, notice: 'Delivery location was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_location }
      else
        format.html { render :new }
        format.json { render json: @delivery_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_locations/1
  # PATCH/PUT /delivery_locations/1.json
  def update
    respond_to do |format|
      if @delivery_location.update(delivery_location_params)
        format.html { redirect_to @delivery_location, notice: 'Delivery location was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_location }
      else
        format.html { render :edit }
        format.json { render json: @delivery_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_locations/1
  # DELETE /delivery_locations/1.json
  def destroy
    @delivery_location.destroy
    respond_to do |format|
      format.html { redirect_to delivery_locations_url, notice: 'Delivery location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_location
      @delivery_location = DeliveryLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_location_params
      params.require(:delivery_location).permit(:location, :restaurant_id)
    end
end
