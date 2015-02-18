class EffortsController < ApplicationController
  def index
    @efforts = Effort.where user: current_user
  end

  def show
    @effort = Effort.find params['id']
  end

  def new
  	  @effort = Effort.new
  	  @types = [['回数', 1], ['時間', 2], ['日数', 3]]
  end

  def create
    @effort = Effort.new effort_params.merge(user: current_user)
    if @effort.save
      redirect_to root_path
    else
    end
  end

  private
  def effort_params
    params.require(:effort).permit(:name, :effort_type, :unit)
  end
end
