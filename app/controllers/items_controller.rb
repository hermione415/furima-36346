class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index, :show, :new]
  before_action :set_item, only: [:edit, :show, :update, :move_to_index]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:items_name, :items_information, :category_id, :item_state_id, :shipcost_id,
                                 :shiparea_id, :daystoship_id, :price, :image).merge(user_id: current_user.id)
  end
end
