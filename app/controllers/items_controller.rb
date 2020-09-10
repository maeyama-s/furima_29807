class ItemsController < ApplicationController

  before_action :move_to_login, only: :new

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
    params.require(:item).permit(:image, :title, :explanation, :price, :category_id, :item_condition_id, :shipping_charges_id, :shipping_area_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
      flash[:notice] = 'You need to sign in or sign up before continuing.'
    end
  end

end
