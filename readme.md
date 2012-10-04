RakeRunner
=========

Purpose and Objectives
----------------------
- make rake files less scary for non-programmers.
- promote best practices and consistenty by placing ops/commonly used tasks in rake files.

How to Use
----------
#install RakeRunner
#upload rake file
#run rake file

Running rake files
------------------
There are three ways to run rake files
- Through the web interface
-- Click the run button next to the rake task you would like to run.  An output pane will apear to the right with the real time output of the task as it is printing to standard out.
- Twillio endpoint
-- send to the twillio phone number with the rake file, task, and any arguments after.  Everything is delimeted by spaces.  
- calling the endpoint directly
-- run a rake tasks by calling the endpoint '/run/(rake_file)/(rake-task)'.  Add a .json extension for a json object reflecting the run output object

Setting up Twillio
------------------

TODO
----
See issues page 
