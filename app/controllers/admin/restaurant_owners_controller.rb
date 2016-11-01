class Admin::RestaurantOwnersController < ApplicationController
    def index
        @restaurant_owners = RestaurantOwner.all
    end
    def new
        @restaurant_owner = RestaurantOwner.new
    end
    def create
    @restaurant_owner = RestaurantOwner.new(restaurant_owner_params)

    respond_to do |format|
      if @restaurant_owner.save
        format.html { redirect_to admin_restaurant_owners_path, notice: 'Clinic lab was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_owner }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_owners/1
  # PATCH/PUT /restaurant_owners/1.json
  def update
    respond_to do |format|
      if @restaurant_owner.update(restaurant_owner_params)
        format.html { redirect_to @restaurant_owner, notice: 'Clinic lab was successfully updated.' }
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
      format.html { redirect_to restaurant_owners_url, notice: 'Clinic lab was successfully destroyed.' }
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
      params.require(:restaurant_owner).permit(:user_id, :restaurant_id)
    end
end
