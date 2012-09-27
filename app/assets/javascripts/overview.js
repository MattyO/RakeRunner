var currentOutputLength = 0;
var latestInterval = -1;

$(document).ready(function(){
    $(".runTask").click(function(){
        $.ajax({
            url: $(this).attr("href") + ".json",
            dataType: "json", 
            success: function(data){
                console.log("task running");
                console.log(data);
                console.log("trying to get output from " +"run_history/"+data.history_id+"/output");
                $.ajax({
                    url:"run_history/"+data.history_id+"/output",
                    success:function(html){
                        console.log("success appending html");
                        $("#task_output").append(html);
                    }
                });
            }
        });
        
        return false;
        });
});
/*
    function updateHistory(historyId){
           $.ajax({
               url:"run_history/" + historyId  + "/tail/" + currentOutputLength + ".json", 
               dataType:"json",
                success: function(data){
                    console.log("currentOutputLenth" + currentOutputLength);
                    console.log(data);
                    $("#output .status").html("Status: " + data.status);
                    for(line_key in data.by_line){
                        $("#output ol").append($('<li>').addClass("L"+currentOutputLength).html(data.by_line[line_key]));
                        currentOutputLength++;

                    }
                    
                    if(data.status == 'finished'){
                        clearInterval(latestInterval);
                        currentOutputLength = 0;
                    }
                }
           });
    }
    */

