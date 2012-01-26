$(function(){

    $("#taste_slide").slider({
        range : "min",
        max : 10,
        min : 0,
        value : 0,
        animate : true,
        orientation : "horizontal",
        slide : function(event, ui){
            $("#p_taste_point").val(ui.value);
            }
        });
    
    $("#speed_slide").slider({
        range : "min",
        max : 10,
        min : 0,
        value : 0,
        animate : true,
        orientation : "horizontal",
        slide : function(event, ui){
            $("#p_speed_point").val(ui.value);
            }
        });


     $("#amount_slide").slider({
        range : "min",
        max : 10,
        min : 0,
        value : 0,
        animate : true,
        orientation : "horizontal",
        slide : function(event, ui){
            $("#p_amount_point").val(ui.value);
            }
        });

 

     $("#service_slide").slider({
        range : "min",
        max : 10,
        min : 0,
        value : 0,
        animate : true,
        orientation : "horizontal",
        slide : function(event, ui){
            $("#p_service_point").val(ui.value);
            }
        });


});
