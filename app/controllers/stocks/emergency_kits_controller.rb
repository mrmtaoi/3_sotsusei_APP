class Stocks::EmergencyKitsController < ApplicationController
  def index
    @stocks = EmergencyKit.all # ここでデータを取得
  end

  def show
    # アクション内容を追加
  end

  def all
    @emergency_kits = EmergencyKit.all
    @stocks = Stock.all
    render :all
  end
end