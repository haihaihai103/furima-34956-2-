class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @items = Item.all.order("created_at ASC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :area_id, :burden_id, :status_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end
 end