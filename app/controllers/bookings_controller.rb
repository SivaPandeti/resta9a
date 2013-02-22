class BookingsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @bookings = Booking.paginate(page: params[:page])
    #respond_with @bookings
    respond_to do |format|
      format.html
      format.json do
        #render :json => @bookings.to_json(:include => [ :customer, :room])
        render :json => @bookings.to_json(:include => [ { :customer => { :only => :first_name}}, { :room => { :only => :room_name}}, { :hotel => { :only => :hotel_name}} ] )
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    #respond_with @booking
    respond_to do |format|
      format.html
      format.json do
        #render :json => @bookings.to_json(:include => [ :customer, :room])
        render :json => @booking.to_json(:include => [ { :customer => { :only => :first_name}}, { :room => { :only => :room_name}}, { :hotel => { :only => :hotel_name}} ] )
      end
    end
  end


  def new
    @booking = Booking.new
  end


  def edit
    @booking = Booking.find(params[:id])
  end


  def create
    @booking = Booking.new(params[:booking])
    @booking.save
    respond_with @booking
  end


  def update
    @booking = Booking.find(params[:id])
    @booking.update_attributes(params[:booking])
    respond_with @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_with @booking
  end
end
