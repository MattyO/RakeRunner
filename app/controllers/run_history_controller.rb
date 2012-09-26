class RunHistoryController < ApplicationController
  def index
    @run_history = RunHistory.all.limit 100

   respond_to do |format|
     format.html 
     format.json {render json: @run_history}
   end
  end

  def show
    @run_history = RunHistory.find(params[:id])
    respond_to do |format|
      format.html 
      format.json {render json: @run_history}
    end
  end

  def output
    run_history =RunHistory.find(params[:id])
  
    @output = run_history.output
    
    respond_to do |format|
      format.html
      format.json { render json: @output}
    end
  end

  def tail_output
    run_history = RunHistory.find(params[:id])
    after_line = params[:line].to_i
    @output = run_history.tailoutput after_line

    respond_to do |format|
      format.html
      format.json { render json: @output}
    end
  end
end
