class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_search_rooms, only: [:search, :opensearch]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  def opensearch
  end

  def search
    #update a variable 'searchedRooms'
    #@searchedRooms = Roomwhere(roomid: '1222')



    #time slot will never be null, Thus making this as compulsory field.
    str_query_bookings=""
    str_query_bookings= " where time = \'"+params[:time] +"\' "

    if params[:date] != ""
      str_query_bookings = str_query_bookings + " AND date = \'" + params[:date] +"\' "
    end

    statusQuery=""
    if params[:status] == "Booked"
      statusQuery=" AND m.status=2"
    elsif params[:status] == "Available"
      statusQuery=" AND bookings.status=0"
    end

    dateQuery=""
    if params[:date] != ""
      dateQuery=" AND bookings.date="+ params[:date]
    end
    timeQuery=""
    if params[:time] != NIL
      timeQuery=" AND bookings.time= \'"+ params[:time]+"\'"
    end

    nilString = ""
    string_sql = ""
    #string_sql = "select m.roomid, m.status, m.building,m.size from (SELECT rooms.roomid as roomid, bookings.status as status,bookings.time as time,bookings.date as date, rooms.building as building, rooms.size as size FROM rooms LEFT JOIN bookings ON rooms.roomid=bookings.roomid where  bookings.time= '"+params[:time]+"' "+statusQuery + dateQuery +") as m where m.building like '%"+ if params[:building] != 'Any' then params[:building] else nilString end +"%'"
    @bookings = Booking.connection.select_all("select m.roomid, m.status, m.building,m.size from (SELECT rooms.roomid as roomid, bookings.status as status,bookings.time as time,bookings.date as date, rooms.building as building, rooms.size as size FROM rooms LEFT JOIN bookings ON rooms.roomid=bookings.roomid) as m where m.building like '%"+ if params[:building] != 'Any' then params[:building] else nilString end +"%'"+statusQuery + dateQuery+timeQuery)
    #@bookings = Booking.connection.select_all(string_sql)
    #render :text => @bookings.to_json
    respond_to do |format|
      format.html { render '/rooms/searched_rooms', notice: 'Room was successfully destroyed.' }
      format.json { render json: @bookings }
    end
  end

  def book

  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_search_rooms
      #@searchedRooms = Room.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:roomid, :status, :size, :building)
    end
end
