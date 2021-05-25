class ItemsController < ApplicationController
  before_action :item_set, only: [:edit, :show]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:new, :show, :index, :create]

  def index
    @items = Item.all.order("created_at DESC")

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

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
end

  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :area_id, :burden_id, :status_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

