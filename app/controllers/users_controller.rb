class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update)
  
  def new 
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user
    else
      swal { error 'ユーザ情報の登録に失敗いたしました 必須事項をご入力くださいませ' }
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def index
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end





