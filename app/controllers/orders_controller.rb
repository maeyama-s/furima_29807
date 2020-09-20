class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :my_item, only: :index
  before_action :sold_out, only: :index

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
      :token, :post_code, :prefectures_id, :city, :adress, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: sell_params[:token],
      currency: 'jpy'
    )
  end

  # 出品ユーザーが自分の商品購入URLを入力した場合
  def my_item
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end

  def sold_out
    item = Item.find(params[:item_id])
    redirect_to root_path if Purchase.find_by(item_id: item.id)
  end
end
