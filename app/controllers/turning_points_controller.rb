class TurningPointsController < ApplicationController
  before_action :set_turning_point, only: [:new, :edit, :update, :destroy]
  before_action :require_user
  def index
    @turning_points = current_user.turning_points.all
    @new_turning_point = TurningPoint.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @turning_points }
    end
  end

  def create
    @turning_point = current_user.turning_points.create(turning_point_params)
    redirect_to turning_points_path
  end

  def edit
    @turning_point = TurningPoint.find(params[:id])
  end

  def update
    @turning_point = TurningPoint.find(params[:id])
    @turning_point.update(turning_point_params)
    redirect_to turning_points_path
  end

  def destroy
    @turning_point = TurningPoint.find(params[:id])
    @turning_point.destroy
    redirect_to turning_points_path
  end

  private

  def set_turning_point
    @turning_point = current_user.turning_points.find(params[:id])
  end

  def turning_point_params
    params.require(:turning_point).permit(:current_task, :enthusiastic, :favorite_word, :unpleasant_thing, :what_i_want_to_do_in_the_future)
  end
end
