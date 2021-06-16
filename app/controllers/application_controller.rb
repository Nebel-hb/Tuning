class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :area_id, :instrument_id])
  end


# 各アクションで権限をチェック。オプションでモデル依存をfalseに。
  # authorize_resource :class => false

  # 権限が無いページへアクセス時の例外処理
  # rescue_from CanCan::AccessDenied do |exception|
  #   # root_urlにかっ飛ばす。
  #   redirect_to root_url
  # end

end
