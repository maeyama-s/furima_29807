class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :unauthorized, only: :edit
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :search_item, only: [:index, :search]

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
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = Comment.where(item_id: params[:id])
    @comment = Comment.new
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @results = @p.result.includes(:category) # 検索条件にマッチした商品の情報を取得
  end

  def namesearch
    @items = Item.search(params[:keyword])
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :title, :explanation, :price, :category_id, :item_condition_id,
      :shipping_charges_id, :shipping_area_id, :days_until_shipping_id, images: []
    ).merge(user_id: current_user.id)
  end

  # 権限のないユーザーが商品編集URLを入力した場合
  def unauthorized
    @item = Item.find(params[:id])
    redirect_to root_path if current_user.id != @item.user_id
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
