class RakeFilesController < ApplicationController
  # GET /rake_files
  # GET /rake_files.json
  def index
    @rake_files = RakeFile.where(:active=>true);

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rake_files }
    end
  end

  def run  
    #puts "filename: #{params[:file_name]}, "
    file= RakeFile.where(:file_name=>params[:rake_file]).first
    file.run params[:task];

  end

  # GET /rake_files/1
  # GET /rake_files/1.json
  def show
    @rake_file = RakeFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rake_file }
    end
  end

  # GET /rake_files/new
  # GET /rake_files/new.json
  def new
    @rake_file = RakeFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rake_file }
    end
  end

  # GET /rake_files/1/edit
  def edit
    @rake_file = RakeFile.find(params[:id])
  end

  # POST /rake_files
  # POST /rake_files.json
  def create
    uploadFile = params[:rake_file][:file]
    fileName = uploadFile.original_filename.chomp(".rake")
    newFilePath = Rails.root.join('private', 'rake_files', "#{fileName}.rake")
    uploadFile = uploadFile.read
    taskNamesFound = Array.new
    #if File.exsits? newFilePath 
    #  fileName += Time.now.delete(' ')
    #end

    File.open(newFilePath, 'w') do |file|
      uploadFile.each_line do |line|
        line.scan(/^task ["'](.+)["']/) { |taskName| taskNamesFound.push taskName.first }
        file.puts line
      end
    end
    puts "number of task names:#{taskNamesFound.size}"

    @rake_file = RakeFile.new(:path=> newFilePath.to_s, :file_name => fileName,  :active=>true)

    respond_to do |format|
      if @rake_file.save
        taskNamesFound.each do |taskName|
          puts "adding taskName: #{taskName}"
          @rake_file.rake_task.create(:task => taskName, :active=>true)
        end
        format.html { redirect_to @rake_file, notice: 'Rake file was successfully created.' }
        format.json { render json: @rake_file, status: :created, location: @rake_file }
      else
        format.html { render action: "new" }
        format.json { render json: @rake_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rake_files/1
  # PUT /rake_files/1.json
  def update
    @rake_file = RakeFile.find(params[:id])

    respond_to do |format|
      if @rake_file.update_attributes(params[:rake_file])
        format.html { redirect_to @rake_file, notice: 'Rake file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rake_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rake_files/1
  # DELETE /rake_files/1.json
  def destroy
    @rake_file = RakeFile.find(params[:id])
    @rake_file.destroy

    respond_to do |format|
      format.html { redirect_to rake_files_url }
      format.json { head :no_content }
    end
  end
end
