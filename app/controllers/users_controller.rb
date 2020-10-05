class UsersController < ApplicationController

  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    # マイページに行くときにカードが未登録であれば、まずはカード登録へ行くように設定
    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params) # 更新出来たかを条件分岐する
      # deviseの仕様でユーザー情報更新するとログアウトするため、ログイン処理。
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to root_path # 更新できたらrootパスへ
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
      card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

      # マイページに行くときにカードが未登録であれば、まずはカード登録へ行くように設定
      redirect_to new_card_path and return unless card.present?

      customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
      @card = customer.cards.first

      @messages = @user.errors.full_messages
      render :show # 失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password) # 編集出来る情報を制限
  end
end
