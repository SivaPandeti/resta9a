class ItemsController < ApplicationController

  respond_to :html, :json, :xml
  def index
    @items = Item.paginate(page: params[:page])
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end

  def new
    @item = Item.new
  end


  def edit
    @item = Item.find(params[:id])
  end


  def create
    @item = Item.new(params[:item])
    @item.save
    respond_with @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    respond_with @item
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_with @item
  end
end
