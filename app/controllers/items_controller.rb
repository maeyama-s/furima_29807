class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  # トップページ
  def index
    @items = Item.order('created_at DESC')
  end

  # 商品出品ページ
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :title, :explanation, :price, :category_id, :item_condition_id,
      :shipping_charges_id, :shipping_area_id, :days_until_shipping_id
    ).merge(user_id: current_user.id)
  end
end
