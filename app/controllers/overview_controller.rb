class OverviewController < ApplicationController

  def index
    require_user
    @rake_tasks = RakeTask.where(:active=>true);

    respond_to do |format|
      format.html 
    end
  end
end
