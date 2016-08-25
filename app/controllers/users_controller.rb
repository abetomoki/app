class UsersController < ApplicationController
  before_action :user_confirmation, only: [:edit, :update, :show]

  def edit
  end
  
  def update
   if @user.update(user_params)
     flash[:success] = "プロフィールを更新しました。"
     redirect_to @user
   else
     render 'edit'
   end
  end
  
  def show
  end
  
  def new
    @user=  User.new
  end
  
  def create
        @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそ、Ajishioへ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :body)
  end
  
  def user_confirmation
    @user = User.find(params[:id])
  end
end
