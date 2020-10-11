class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_item

  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # deviseにおけるストロングパラメーターであり、追加したメソッドのパラメーターを取得できるようになる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :nickname, :family_name, :first_name, :family_name_katakana,
                                        :first_name_katakana, :birthday
                                      ])
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
