class ItemsController < ApplicationController

  # トップページ
  def index
  end

  #商品出品ページ
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :price, :category_id, :item_condition_id, :shipping_charges_id)
  end

end
