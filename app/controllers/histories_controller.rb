class HistoriesController < ApplicationController
  def new
    @history = History.new
    @effort_id = params[:effort_id]
  end

  def create
    @history = History.new history_params.merge(date: Date.today, effort_id: params[:effort_id])
    if @history.save
      redirect_to effort_path params[:effort_id]
    else
    end
  end

  private
  def history_params
    params.require(:history).permit(:quantity)
  end
end
