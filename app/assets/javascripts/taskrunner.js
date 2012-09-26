var TaskRunner(taskId, containerID) = {

   this.taskId = taskId;
   this.containerID = containerID
   this.currentOutputLength = 0

   this.runTask = function(){
       
       $("#"+this.containerID).append($("div").attr('id', 'output').addClass("output span6"));
       $("#output").append($("div").addClass("outputText"));
       setTimeout(this.update(),1500);

   }

   this.update(){
       $.ajax({
           url:"run_history/" +this.taskId +"/tail/"+this.currentOutputLength+".json", 
           dataType:"json",
           success: function(data){
           }
       });
    
   }

}
