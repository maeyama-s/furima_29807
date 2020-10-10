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
    @user = User.find_by(params[:user_id])
    @favorites = Favorite.where(user_id: @user.id)
  end
end
