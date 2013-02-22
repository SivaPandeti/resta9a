class OrdersController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @orders = Order.paginate(page: params[:page])
    #respond_with @orders
    respond_to do |format|
      format.html
      format.json do
        render :json => @orders.to_json(:include => { :item => { :only => :name}})
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    # respond_with @order
    respond_to do |format|
      format.html
      format.json do
        render :json => @order.to_json(:include => { :item => { :only => :name}})
      end
    end
  end

  def new
    @order = Order.new
  end


  def edit
    @order = Order.find(params[:id])
  end


  def create
    @order = Order.new(params[:order])
    @order.save
    respond_with @order
  end


  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_with @order
  end


end
