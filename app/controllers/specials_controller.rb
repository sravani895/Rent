class SpecialsController < ApplicationController
  before_action :set_special, only: [:show, :edit, :update, :destroy]
	def index
		@specials = Special.all
	end

	def new
		@special = Special.new
		 @room = Room.find(params[:room_id])
	end

	def create
	@room = Room.find(params[:room_id])
    @special = Special.new(special_params)
    if @special.save
      redirect_to  room_special_path(@room, @special)
    else
      render action: "new"
    end
	end

	def show
 	@room = Room.find(params[:room_id])
 	@specials = Special.all
 	@special = Special.find(params[:id])
	end

	def edit
	 @room = Room.find(params[:room_id])
	end
	def update
    @room = Room.find(params[:room_id])
    if @special.update(special_params)
    	redirect_to room_special_path(@room, @special)
    else 
    	render :edit
    end
	end
	def destroy
    @special.destroy
    redirect_to room_special_path, notice: 'special price was successfully destroyed.'
end
    private
    def set_special
      @special = Special.find(params[:id])
    end

  	def special_params
    params[:special].permit(:start_date, :end_date,:room_id)
  	end
end
