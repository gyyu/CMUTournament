class RoomsController < AdminController
  before_action :require_admin

  # GET /room/new
  def new
    @rooms = Room.all
    @room = Room.new
  end

  # POST /room
  # POST /room.json
  def create
    puts room_params
    puts params
    @room = Room.new(room_params)


    respond_to do |format|
      if @room.save
        format.html { redirect_to "/rooms/new", notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_name)
    end

end
