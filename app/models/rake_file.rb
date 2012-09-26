class RakeFile < ActiveRecord::Base
  attr_accessible :active, :file_name, :path
  has_one :user 
  has_many :rake_task

end
