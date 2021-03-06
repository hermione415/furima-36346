class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path  
    elsif @item.order.present?
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(order_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name,
                                             :telephone_number).merge(token: params[:token], user_id: current_user.id,
                                                                      item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
