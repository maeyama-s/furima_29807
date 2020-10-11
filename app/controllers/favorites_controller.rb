class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
    @favorite.save
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
    redirect_to item_path(params[:item_id])
  end

  def index
    @favorites = Favorite.where(user_id: params[:user_id]).order('created_at DESC')
  end
end
