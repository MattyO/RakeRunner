var currentOutputLength = 0;
var latestInterval = -1;

$(document).ready(function(){
    $(".runTask").click(function(){
        $.ajax({
            url: $(this).attr("href") + ".json",
            dataType: "json", 
            success: function(data){
                console.log(data);
                var output = $('<div>').attr('id', 'output').addClass("output span6 ");
                var title = $("<div>").addClass("span6");
                title.append($('<h2>').addClass("title").html("Output"));
                title.append($('<span>').addClass("status label label-info").html("Status: " + data.status));
                output.append(title);

                output.append($('<div>').addClass("span6 well prettyprint linenums").append($('<ol>').addClass("outputText linenums ")));
                
                $(".row").last().append(output);
                latestInterval = setInterval("updateHistory("+data.history_id+")", 1500);
            }
        });
        
        return false;
        });
});

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
    

