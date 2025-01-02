class Stocks::StocksController < ApplicationController
  def index
    @stocks = Stock.all # ここでデータを取得
  end

  def show
    # アクション内容を追加
  end
end