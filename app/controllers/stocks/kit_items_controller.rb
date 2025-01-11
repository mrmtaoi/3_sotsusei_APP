class Stocks::KitItemsController < ApplicationController
  before_action :set_emergency_kit
  before_action :set_kit_item, only: [:edit, :update, :destroy]
  
  def index
    # 該当する emergency_kit を取得
    @emergency_kit = EmergencyKit.find(params[:emergency_kit_id])

    # emergency_kit に関連する kit_items を取得
    @kit_items = @emergency_kit.kit_items
  end

  def create
    @kit_item = @emergency_kit.kit_items.build(kit_item_params)
    if @kit_item.save
      redirect_to stocks_emergency_kit_path(@emergency_kit), notice: 'Kit item was successfully added.'
    else
      redirect_to stocks_emergency_kit_path(@emergency_kit), alert: 'Failed to add kit item.'
    end
  end
  
  def edit
  end
  
  def update
    if @kit_item.update(kit_item_params)
      redirect_to emergency_kit_path(@emergency_kit), notice: 'Kit item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @kit_item.destroy
    redirect_to emergency_kit_path(@emergency_kit), notice: 'Kit item was successfully deleted.'
  end
  
  private
  
  def set_emergency_kit
    @emergency_kit = EmergencyKit.find(params[:emergency_kit_id])
  end
  
  def set_kit_item
    @kit_item = @emergency_kit.kit_items.find(params[:id])
  end
  
  def kit_item_params
    params.require(:kit_item).permit(:name, :quantity)
  end
end
  