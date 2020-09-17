class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
  end

  def create
    @item = User.create(item_params)
  end

  private

  def item_params
    params.require(:).permit(:)
  end
end
