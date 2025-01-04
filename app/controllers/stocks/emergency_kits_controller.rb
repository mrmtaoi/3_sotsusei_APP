class Stocks::EmergencyKitsController < ApplicationController
  def index
    @stocks = EmergencyKit.all
  end

  def show
    # 必要なら処理を追加
  end

  def new
    @emergency_kit = EmergencyKit.new
    @gender_options = EmergencyKitsOwner.genders_i18n.invert.map { |key, value| [key, value] }
    @emergency_kit.build_reminder # Reminder を初期化
  end

def create
  gender = EmergencyKitsOwner.genders.key(emergency_kit_params[:gender])

  # EmergencyKitsOwner を作成または取得
  owner = EmergencyKitsOwner.find_or_create_by(user_id: current_user.id, name: emergency_kit_params[:owner_name])
  owner.update(age: emergency_kit_params[:age], gender: gender) if owner.persisted?

  # デバッグログ
  logger.debug("EmergencyKitsOwner existence: #{EmergencyKitsOwner.exists?(id: owner.id)}")
  logger.debug("Owner: #{owner.inspect}")

  # EmergencyKit を作成
  @emergency_kit = EmergencyKit.new(
    owner_id: owner.id,
    user_id: current_user.id,
    storage: emergency_kit_params[:storage]
  )

  # Reminder を初期化
  @emergency_kit.build_reminder(emergency_kit_params.dig(:reminder_attributes)) if @emergency_kit.reminder.nil?

  if @emergency_kit.save
    redirect_to stocks_emergency_kits_path, notice: "防災バッグが登録されました！"
  else
    logger.debug("Errors: #{@emergency_kit.errors.full_messages}")  # エラーメッセージをログに出力
    render :new, status: :unprocessable_entity
  end
end

  
  private

  def emergency_kit_params
    params.require(:emergency_kit).permit(
      :storage, 
      :owner_name, 
      :age, 
      :gender, 
      reminder_attributes: [:interval_months]
    )
  end
end
