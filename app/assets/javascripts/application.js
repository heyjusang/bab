// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//require jquery
//=require jquery_ujs
//require_tree .




/////////////////////popup

 popupStatus = 0;

function loadPopup(popUp){
    if(popupStatus==0){
        $("#backgroundPopup").css({
            "opacity":"0.7"
        });
        $("#backgroundPopup").fadeIn("slow");
        $(popUp).fadeIn("slow");
            popupStatus=1;
    }
}

function disablePopup(popUp){
    if(popupStatus==1){
        $("#backgroundPopup").fadeOut("slow");
        $(popUp).fadeOut("slow");
        popupStatus = 0;
    }
}

function centerPopup(popUp){

    var windowWidth = document.documentElement.clientWidth;
    var windowHeight = document.documentElement.clientHeight;
    var popupHeight = $(popUp).height();
    var popupWidth = $(popUp).width();
    $(popUp).css({
        "position" : "absolute",
        "top" : "20px",
        "left" : windowWidth/2-popupWidth/2
    });
}
////////////////////////////////////////////////////

$(document).ready(function(){
        
/////////////////////////////////////////////////////////////////
    $(".signupPop").click(function(){
        centerPopup('#signupContact');
        loadPopup('#signupContact');
    });

    $("#popupContactClose").click(function(){
        disablePopup('#signupContact');
    });
    $(document).keydown(function(e){
        if(e.keyCode==27 && popupStatus==1){
            disablePopup('#signupContact');
        }
    });
/////////////////////////////////////////////////////////////






});

