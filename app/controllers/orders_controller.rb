class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @sell = ItemSell.new
  end

  def create
    @sell = ItemSell.new(sell_params)
    if @sell.valid?
      pay_item
      @sell.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def sell_params
    params.require(:item_sell).permit(
      :post_code, :prefectures_id, :city, :adress, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def token_params
    params.permit(:token)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_2c6b92b154255cf42559448c"
    Payjp::Charge.create(
      amount: @item.price,
      card: token_params[:token],
      currency:'jpy'
    )
  end
end
