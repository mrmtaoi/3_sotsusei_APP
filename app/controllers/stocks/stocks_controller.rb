class Stocks::StocksController < ApplicationController
  def index
    @stocks = Stock.all
    @stocks = current_user.stocks
  end

  def show
    # showアクションは省略
  end

  def new
    @stock = Stock.new
    stock_item = @stock.stock_items.build
    stock_item.reminders.build # Reminder を作成
  end

  def create
    logger.debug "PARAMS: #{params.inspect}"
    @stock = Stock.new(stock_params)
    @stock.user = current_user # 現在のユーザーを関連付ける

    if @stock.save
      redirect_to stocks_stocks_path, notice: '備蓄アイテムが登録されました。'
    else
      Rails.logger.debug @stock.errors.full_messages # エラー内容をログに出力
      render :new, status: :unprocessable_entity
    end
  end

  private

  def stock_params
    params.require(:stock).permit(
      :body,
      stock_items_attributes: [
        :quantity, :storage, :stock_item_name, # stock_item_name を許可
        reminders_attributes: [:interval_months, :expiration_date] # reminder の属性を正しくネスト
      ]
    )
  end
end
