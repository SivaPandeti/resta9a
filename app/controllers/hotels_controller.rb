class HotelsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @hotels = Hotel.paginate(page: params[:page])
    respond_with @hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
    respond_with @hotel
  end

  def new
    @hotel = Hotel.new
  end


  def edit
    @hotel = Hotel.find(params[:id])
  end


  def create
    @hotel = Hotel.new(params[:hotel])
    @hotel.save
    respond_with @hotel
  end


  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update_attributes(params[:hotel])
    respond_with @hotel
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    respond_with @hotel
  end
end
