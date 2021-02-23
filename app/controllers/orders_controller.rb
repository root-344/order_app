class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only:[:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      #pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_address_params
    params.require(:order_address).permit(:zip, :region_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user || @item.order.present? 
      redirect_to root_path
    end 
  end
end
