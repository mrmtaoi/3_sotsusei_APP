class RemindersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user = current_user
  
    if @reminder.save
      redirect_to some_path, notice: 'リマインドが追加されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
      redirect_to some_path, notice: 'リマインドが削除されました。'
  end
  
  private
  
  def reminder_params
    params.require(:reminder).permit(:kit_item_id, :stock_item_id)
  end
end
  