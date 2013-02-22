class RoomsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @rooms = Room.paginate(page: params[:page])
    #respond_with @rooms
    respond_to do |format|
      format.html
      format.json do
        render :json => @rooms.to_json(:include => { :hotel => { :only => :hotel_name}})
        #render :json => @rooms.to_json(:include => { :hotel => { :only => [ :hotel_name, :city ]}})
        #render :json => @rooms.to_json(:include => [ :hotel])
      end
    end
  end

  def show
    @room = Room.find(params[:id])
    #respond_with @room
    respond_to do |format|
      format.html
      format.json do
        render :json => @room.to_json(:include => { :hotel => { :only => :hotel_name}})
      end
    end
  end

  def new
    @room = Room.new
  end


  def edit
    @room = Room.find(params[:id])
  end


  def create
    @room = Room.new(params[:room])
    @room.save
    respond_with @room
  end


  def update
    @room = Room.find(params[:id])
    @room.update_attributes(params[:room])
    respond_with @room
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    respond_with @room
  end
end
