class CommandParameter < ActiveRecord::Base
  attr_accessible :name, :type
  belongs_to :rake_task
end
