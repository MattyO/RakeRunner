class RakeTasksController < ApplicationController
  # GET /rake_tasks
  # GET /rake_tasks.json
  def index
    @rake_tasks = RakeTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rake_tasks }
    end
  end

  # GET /rake_tasks/1
  # GET /rake_tasks/1.json
  def show
    @rake_task = RakeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rake_task }
    end
  end

  # GET /rake_tasks/new
  # GET /rake_tasks/new.json
  def new
    @rake_task = RakeTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rake_task }
    end
  end

  # GET /rake_tasks/1/edit
  def edit
    @rake_task = RakeTask.find(params[:id])
  end

  # POST /rake_tasks
  # POST /rake_tasks.json
  def create
    @rake_task = RakeTask.new(params[:rake_task])

    respond_to do |format|
      if @rake_task.save
        format.html { redirect_to @rake_task, notice: 'Rake task was successfully created.' }
        format.json { render json: @rake_task, status: :created, location: @rake_task }
      else
        format.html { render action: "new" }
        format.json { render json: @rake_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rake_tasks/1
  # PUT /rake_tasks/1.json
  def update
    @rake_task = RakeTask.find(params[:id])

    respond_to do |format|
      if @rake_task.update_attributes(params[:rake_task])
        format.html { redirect_to @rake_task, notice: 'Rake task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rake_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rake_tasks/1
  # DELETE /rake_tasks/1.json
  def destroy
    @rake_task = RakeTask.find(params[:id])
    @rake_task.destroy

    respond_to do |format|
      format.html { redirect_to rake_tasks_url }
      format.json { head :no_content }
    end
  end
end
