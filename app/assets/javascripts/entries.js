$(document).ready(function() {    
    
    $("#key-input").on('input', function() {
        params = {data: { key: $(this).val() } }
        $.post("/search", params, function(results) {
            resultHTML = "";
            for(i = 0; i < results.length; i++) {
                resultHTML += "<li>" + results[i] + "</li>";
            }
            $("#results-list").html(resultHTML);
        });
    });
});
