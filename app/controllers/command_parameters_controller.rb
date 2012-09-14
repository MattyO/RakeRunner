class CommandParametersController < ApplicationController
  # GET /command_parameters
  # GET /command_parameters.json
  def index
    @command_parameters = CommandParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @command_parameters }
    end
  end

  # GET /command_parameters/1
  # GET /command_parameters/1.json
  def show
    @command_parameter = CommandParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @command_parameter }
    end
  end

  # GET /command_parameters/new
  # GET /command_parameters/new.json
  def new
    @command_parameter = CommandParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @command_parameter }
    end
  end

  # GET /command_parameters/1/edit
  def edit
    @command_parameter = CommandParameter.find(params[:id])
  end

  # POST /command_parameters
  # POST /command_parameters.json
  def create
    @command_parameter = CommandParameter.new(params[:command_parameter])

    respond_to do |format|
      if @command_parameter.save
        format.html { redirect_to @command_parameter, notice: 'Command parameter was successfully created.' }
        format.json { render json: @command_parameter, status: :created, location: @command_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @command_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /command_parameters/1
  # PUT /command_parameters/1.json
  def update
    @command_parameter = CommandParameter.find(params[:id])

    respond_to do |format|
      if @command_parameter.update_attributes(params[:command_parameter])
        format.html { redirect_to @command_parameter, notice: 'Command parameter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @command_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /command_parameters/1
  # DELETE /command_parameters/1.json
  def destroy
    @command_parameter = CommandParameter.find(params[:id])
    @command_parameter.destroy

    respond_to do |format|
      format.html { redirect_to command_parameters_url }
      format.json { head :no_content }
    end
  end
end
