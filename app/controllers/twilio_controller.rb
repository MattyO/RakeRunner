class TwilioController < ApplicationController

  def index
    from = params["From"]
    body = params["Body"]

    bodyParts = body.split ' '
    file = bodyParts.shift
    task = bodyPars.shift
    args = bodyParts

    rakeFile = RakeFile.where(:file_name=>file).first;
    rakeFile.run(task, args);
  end
end
