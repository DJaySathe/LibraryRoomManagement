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

    @bookings = Booking.connection.select_all("SELECT roomid FROM bookings " + str_query_bookings )

    str_query = ""
    arr = Array.new
    @bookings.each do |searchedRoom|	arr << searchedRoom['roomid'] end
    if arr.length > 0
      arrStr = arr.join(',')
      if params[:status] == 'Any'
        str_query = ""
      elsif params[:status] == 1
        str_query = " where roomid IN (" + arrStr + ")  "
      else
        str_query = " where roomid NOT IN (" + arrStr + ")  "
      end

    end


    if params[:roomid] != ""
      str_query = " where roomid = " + params[:roomid] + "  "
      if params[:building] != "Any"
        str_query = str_query + " AND building = \'" + params[:building] + "\' "
        if params[:size] != "Any"
          str_query = str_query + "AND size = " + params[:size] + " "
        end
      else
        if params[:size] != "Any"
          str_query = str_query + "AND size = " + params[:size] + " "
        end
      end
    else
      if str_query == ""
        if params[:building] != "Any"
          str_query = " where building = \'" + params[:building] + "\' "
          if params[:size] != "Any"
            str_query = str_query + "AND size = " + params[:size] + " "
          end
        else
          if params[:size] != "Any"
            str_query = " where size = " + params[:size] + " "
          end
        end
      else
        if params[:building] != "Any"
          str_query = str_query +" AND building = \'" + params[:building] + "\' "
          if params[:size] != "Any"
            str_query = str_query + "AND size = " + params[:size] + " "
          end
        else
          if params[:size] != "Any"
            str_query = " AND size = " + params[:size] + " "
          end
        end
      end
    end


    @searchedRooms = Room.connection.select_all("SELECT * FROM rooms " + str_query )

    #render :text => @bookings.to_yaml

    respond_to do |format|
      format.html { render '/rooms/searched_rooms', notice: 'Room was successfully destroyed.' }
      format.json { render json: @searchedRooms }
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
