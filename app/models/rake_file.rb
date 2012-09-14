class RakeFile < ActiveRecord::Base
  attr_accessible :active, :file_name, :path
  has_one :user 
  has_many :rake_task

  def run taskName, args=""
    output_file = read_attribute(:file_name) + "." + taskName + Time.now.to_s.delete(" ")
    destination ="#{Rails.root.join("private", "output", output_file)}" 
    commandToRun = "rake -f #{read_attribute :path} #{taskName}" 
    
    Dir.chdir Rails.root.join("private","rake_files") do 
      system "#{commandToRun} > #{destination}"
    end
    output_file
  end

end
