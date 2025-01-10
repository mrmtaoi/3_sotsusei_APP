class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      # ユーザーを保存後に認証メールを送信
      @user.send_confirmation_instructions
      redirect_to confirmation_sent_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id]) 
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end
end
