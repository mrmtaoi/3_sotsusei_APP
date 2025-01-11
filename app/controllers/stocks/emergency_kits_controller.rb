class Stocks::EmergencyKitsController < ApplicationController
  def index
    @emergency_kits = EmergencyKit.where(user: current_user) # ユーザーの防災バッグを取得
  end

  def show
    @emergency_kit = EmergencyKit.find(params[:id])
    @emergency_kits_owner = @emergency_kit.owner
    @kit_items = @emergency_kit.kit_items # 関連するアイテムを取得
  end  

  def new
    @emergency_kit = EmergencyKit.new
    @gender_options = EmergencyKitsOwner.genders_i18n.invert.map { |key, value| [key, value] }
    @emergency_kit.build_reminder # Reminder を初期化
  end

def create
  user = current_user
  gender = EmergencyKitsOwner.genders.key(emergency_kit_params[:gender])

      # パラメータを使用してオーナー情報を取得または作成
      owner = EmergencyKitsOwner.find_or_create_by(
        user_id: current_user.id,
        name: emergency_kit_params[:owner_name],
        age: emergency_kit_params[:age],
        gender: emergency_kit_params[:gender]
      )

    # EmergencyKit の作成
    @emergency_kit = EmergencyKit.new(
      user: user,
      owner: owner,
      body: emergency_kit_params[:body],
      storage: emergency_kit_params[:storage]
    )

    if @emergency_kit.save
      # 保存に成功した場合
      redirect_to stocks_emergency_kits_path, notice: 'Emergency kit was successfully created.'
    else
      # 保存に失敗した場合
      render :new
    end
  end

  def edit
    @emergency_kit = EmergencyKit.find(params[:id])
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
