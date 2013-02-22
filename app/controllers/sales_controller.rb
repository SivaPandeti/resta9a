class SalesController < ApplicationController
  respond_to :html, :json, :xml
  def index
    @sales = Sale.paginate(page: params[:page])
    #respond_with @sales
    respond_to do |format|
      format.html
      format.json do
        #render :json => @bookings.to_json(:include => [ :customer, :room])
        render :json => @sales.to_json(:include => [ :customer, {:product => { :only => :model}} ] )
      end
    end
  end

  def show
    @sale = Sale.find(params[:id])
    #respond_with @sale
    respond_to do |format|
      format.html
      format.json do
        #render :json => @bookings.to_json(:include => [ :customer, :room])
        render :json => @sale.to_json(:include => [ :customer, {:product => { :only => :model}} ] )
      end
    end
  end

  def new
    @sale = Sale.new
  end


  def edit
    @sale = Sale.find(params[:id])
  end


  def create
    @sale = Sale.new(params[:sale])
    @sale.save
    respond_with @sale
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update_attributes(params[:sale])
    respond_with @sale
  end


  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    respond_with @sale
  end
end
