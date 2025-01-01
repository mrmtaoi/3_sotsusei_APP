class ApplicationController < ActionController::Base
  def top
    if user_signed_in?
    # ログイン後のトップページにリダイレクト
      redirect_to static_pages_top_path and return
    else
    # ログイン前のトップページをレンダリング
      render 'static_pages/welcome'
    end
  end
end
  