#require 'TaskJob'

class RunHistory < ActiveRecord::Base
  belongs_to :rake_task
  attr_accessible :enqueued, :filename, :finished, :started, :status

  def output
    tailoutput 0
  end

  def tailoutput afterLine
    output= {:history_id=>id, :status =>status, :by_line=>{}} 
    counter = 0

    if File.exists? filename 
      file = File.open(filename,'r').read
      file.each_line do |line|
        counter += 1
        if counter > afterLine
          output[:by_line][counter] = line
        end
      end
    else 
      if output[:status].nil?
        output[:status] = "not-even-enqueued";
      end
    end

    output[:num_lines] = counter
    output
  end

  def run args={}
#    Delayed::Job.enqueue TaskJob.new('string')
    args[:destination] = read_attribute :filename 
    RakeTask.find(read_attribute(:rake_task_id)).run args
  end
  handle_asynchronously :run

  def enqueue(job)
    history = RunHistory.find(read_attribute(:id))
    history.enqueued= Time.now.to_datetime
    history.status = 'enqueue'
    history.save
  end

  def before(job)
    history = RunHistory.find(read_attribute(:id))
    history.started= Time.now.to_datetime
    history.status = 'running'
    history.save
  end

  def after(job)
    history = RunHistory.find(read_attribute(:id))
    history.finished = Time.now.to_datetime
    history.status = 'finished'
    history.save
  end

  def success(job)
    history = RunHistory.find(read_attribute(:id))
    history.finished = Time.now.to_datetime
    history.status = 'finished-success'
    history.save
  end

  def error(job)
    history = RunHistory.find(read_attribute(:id))
    history.finished = Time.now.to_datetime
    history.status = 'finished-error'
    history.save
  end
end
