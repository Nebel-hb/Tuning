class ApplicationController < ActionController::Base

# 各アクションで権限をチェック。オプションでモデル依存をfalseに。
  # authorize_resource :class => false

  # 権限が無いページへアクセス時の例外処理
  # rescue_from CanCan::AccessDenied do |exception|
  #   # root_urlにかっ飛ばす。
  #   redirect_to root_url
  # end

end
