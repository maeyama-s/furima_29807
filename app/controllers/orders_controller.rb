class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :my_item, only: :index
  before_action :sold_out, only: :index

  def index
    # カードが未登録の状態であれば、まずはカード登録から始める必要がある。
    redirect_to new_card_path and return unless current_user.card.present?

    @item = Item.find(params[:item_id])
    @sell = ItemSell.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sell = ItemSell.new(sell_params)
    if @sell.valid?

      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
      customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        customer: customer_token, # 顧客のトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )

      @sell.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sell_params
    params.require(:item_sell).permit(
      :token, :post_code, :prefectures_id, :city, :adress, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
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
