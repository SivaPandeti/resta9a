class CustomersController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @customers = Customer.paginate(page: params[:page])
    respond_with @customers
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with @customer
  end

  def new
    @customer = Customer.new
  end


  def edit
    @customer = Customer.find(params[:id])
  end


  def create
    @customer = Customer.new(params[:customer])
    @customer.save
    respond_with @customer
  end


  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(params[:customer])
    respond_with @customer
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_with @customer
  end
end
