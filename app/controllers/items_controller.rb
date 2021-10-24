class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :items_information, :category_id, :item_state_id, :shipcost_id,
                                 :shiparea_id, :daystoship_id, :price, :image).merge(user_id: current_user.id)
  end
end
