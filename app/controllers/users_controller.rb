class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to user_url(@user), notice: "ようこそ、Sample Blog へ！"
      else
        render :new, status: :unprocessable_entity # rails7 から必須のオプション
      end
    end
  end

  def update
      if @user.update(user_params)
        redirect_to user_url(@user), notice: "ユーザーアカウントを編集しました。"
      else
        render :edit, status: :unprocessable_entity # rails7 から必須のオプション
      end
    end
  # end

  def destroy
    @user.destroy
      redirect_to users_url, notice: "ユーザーアカウントを削除しました。", status: :see_other # rails7 から必須のオプション
    end
  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
# end
    def require_same_user
      if current_user != @user
        flash[:alert] = "許可されていない操作です。プロフィールの編集、削除は作成者ご自身のみ可能です。"
        redirect_to @user
      end
    end
