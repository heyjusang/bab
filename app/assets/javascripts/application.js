// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .




/////////////////////popup-signup

var popupStatus =0;

function loadPopup(){
    if(popupStatus==0){
        $("#backgroundPopup").css({
            "opacity":"0.7"
        });
        $("#backgroundPopup").fadeIn("slow");
        $("#popupContact").fadeIn("slow");
            popupStatus=1;
    }
}

function disablePopup(){
    if(popupStatus==1){
        $("#backgroundPopup").fadeOut("slow");
        $("#popupContact").fadeOut("slow");
        popupStatus = 0;
    }
}

function centerPopup(){

    var windowWidth = document.documentElement.clientWidth;
    var windowHeight = document.documentElement.clientHeight;
    var popupHeight = $("#popupContact").height();
    var popupWidth = $("#popupContact").width();
    $("#popupContact").css({
        "position" : "absolute",
        "top" : windowHeight/2-popupHeight/2,
        "left" : windowWidth/2-popupWidth/2
    });
}


$(document).ready(function(){
    $(".signupPop").click(function(){
        centerPopup();
        loadPopup();
    });

    $("#popupContactClose").click(function(){
        disablePopup();
    });
    $(document).keydown(function(e){
        if(e.keyCode==27 && popupStatus==1){
            disablePopup();
        }
    });
});

