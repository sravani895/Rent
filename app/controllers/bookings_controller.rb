class BookingsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @user = current_user
    @room = Room.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
 
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id

    respond_to do |format|
      if @booking.save
        #binding.pry
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      #binding.pry
      if @booking.update(booking_params)
        #binding.pry
        format.html { redirect_to @booking, notice: 'booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
       else
         format.html { render :edit }
         format.json { render json: @booking.errors, status: :unprocessable_entity }
       end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def unconfirmed
  authorize! :unconfirmed ,Booking.new
  @bookings = Booking.all
end
def future
authorize! :future,Booking.new
@bookings = Booking.all
  end
  def past
    authorize! :past,Booking.new
    @bookings = Booking.all
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :user_id, :room_id, :is_confirmed)
    end
end
