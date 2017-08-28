class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show] 
  #load_and_authorize_resource
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    @user = current_user
    @images = Image.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @booking = Booking.new
  end

  # GET /rooms/new
  def new
    @room = Room.new    
    @image = Image.new
   
  end

  # GET /rooms/1/edit
  def edit
  end

  
  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
     respond_to do |format|
      if @room.save
        # Notification.isauthorize_confirmation.deliver
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def unauthorized
    @rooms = Room.all
  end
  def myrooms
     @rooms = Room.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :description, :price, :rules, :minimum_days, :address, :lat, :lng, :is_authorized, :city_id, :user_id,images_attributes:[:id,:image,:room_id],amenity_ids: [])
    end
end
