class ItemsController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:item).permit(:title, :concept, :price, :category_id, :area_id, :burden_id, :status_id, :days_ship, :image).merge(user_id: current_user.id)
  end

end
