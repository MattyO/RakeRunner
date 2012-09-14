class OverviewController < ApplicationController

  def index
    @rake_tasks = RakeTask.where(:active=>true);

    respond_to do |format|
      format.html 
    end
  end
end
