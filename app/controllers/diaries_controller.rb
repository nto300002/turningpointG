class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  def index
    @diaries = current_user.diaries.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.create(diary_params)
    redirect_to diaries_path
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to diaries_path
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :detail, :emotion, :evaluation)
  end
end
