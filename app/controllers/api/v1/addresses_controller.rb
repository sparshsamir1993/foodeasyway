class  Api::V1::AddressesController < Api::V1::BaseController
    before_action :set_address, only: [:show, :edit, :update, :destroy]
  
    # GET /addresses
    # GET /addresses.json
    def index
      user_id = params[:user_id]
      addresses = Address.where(user_id: user_id)
      render json: addresses,
          each_serializer: Api::V1::AddressSerializer
    end
  
    # GET /addresses/1
    # GET /addresses/1.json
    def show
    end
  
    # GET /addresses/new
    def new
      @address = Address.new
    end
  
    # GET /addresses/1/edit
    def edit
    end
  
    # POST /addresses
    # POST /addresses.json
    def create
      @address = Address.new(full_address: params[:full_address], name: params[:name], lat: params[:lat], lng: params[:lng], user_id: params[:user_id], city: params[:city])
        if @address.save
          render(json: Api::V1::AddressSerializer.new(@address).to_json)
        else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /addresses/1
    # PATCH/PUT /addresses/1.json
    def update
      respond_to do |format|
        if @address.update(full_address: params[:full_address], name: params[:name], lat: params[:lat], lng: params[:lng], user_id: params[:user_id], city: params[:city])
          render(json: Api::V1::AddressSerializer.new(@address).to_json)
        else
          format.html { render :edit }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /addresses/1
    # DELETE /addresses/1.json
    def destroy
      @address.destroy
      respond_to do |format|
        format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_address
        @address = Address.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def address_params
        params.require(:address).permit(:name, :user_id, :full_address)
      end
  end
  