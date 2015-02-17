class EffortsController < ApplicationController
  def new
  	  @effort = Effort.new
  	  @types = [['回数', 1], ['時間', 2], ['日数', 3]]
  end

  def create
    @effort = Effort.new effort_params
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
