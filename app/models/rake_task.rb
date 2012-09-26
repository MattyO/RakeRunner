require 'pty'

class RakeTask < ActiveRecord::Base
  attr_accessible :active, :task
  belongs_to :user
  belongs_to :rake_file
  has_many :command_parameters
  has_many :run_history

  def destination 
    outputFile = RakeFile.find(read_attribute(:rake_file_id)).file_name + "." + read_attribute(:task) + Time.now.to_s.delete(" ")
    destination ="#{Rails.root.join("private", "output", outputFile)}" 
  end

  def delay_run args={}
    newRunHistory = run_history.create(:filename=>destination) 
    newRunHistory.save
    newRunHistory.run args
    newRunHistory
  end

  def run args={} 
    filePath = ""

    if args.has_key? :destination
      filePath  = args[:destination]
    else
      filePath = destination 
    end
  

    commandToRun = "rake -f #{RakeFile.find(read_attribute(:rake_file_id)).path} #{read_attribute :task }" 
    
        f = open(filePath, 'a') 
        f.close()
    Dir.chdir Rails.root.join("private","rake_files") do 
      PTY.spawn(commandToRun) do |r,w,pid|
        r.each do |line|
          f = open(filePath, 'a') 
          f.puts line;
          f.close()
        end
      end
      #open("|#{commandToRun}").each do |line| 
      #end
        
    end

    destination 
  end

end
