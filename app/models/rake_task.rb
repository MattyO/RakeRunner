class RakeTask < ActiveRecord::Base
  attr_accessible :active, :task
  belongs_to :user
  belongs_to :rake_file
  has_many :command_parameters

end
