
function showRes(id){
    $.getJSON('/bab/view_res?res_id=' + id, resProfile)
}

function resProfile(obj){
    $('#right_item').html('');
    $('#menuContact').html('');
///////////////////////////////////////////////////////////////
    $('#right_item').append('<div id="res_profile"></div>');
    $('#right_item').append('<div id="supplement_box"></div>');
    $('#right_item').append('<div id="review_box"></div>');
    $('body').append('<div id="menuContact"></div>');
///////////////////////////////////////////////////////////////
    $('#res_profile').append('<table></table>');

    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');
    $('#res_profile table').append('<tr></tr>');

    $('#res_profile tr:nth-child(1)').append('<td colspan="3" class="table_name">Restaurant Information</td>');
    $('#res_profile tr:nth-child(2)').append('<td rowspan="4" class="table_image"></td><td class="table_row1">taste</td><td id="taste_point"></td>');
    $('#res_profile tr:nth-child(3)').append('<td class="table_ev_list">speed</td><td class="table_row1" id="speed_point"></td>');
    $('#res_profile tr:nth-child(4)').append('<td class="table_row1">amount</td><td id="amount_point"></td>');
    $('#res_profile tr:nth-child(5)').append('<td>service</td><td class="table_row1" id="service_point"></td>');
    $('#res_profile tr:nth-child(6)').append('<td colspan="2" class="table_row1"></td><td rowspan="2"></td>');
    $('#res_profile tr:nth-child(7)').append('<td colspan="2"></td>');

    $('#taste_point').append(obj.restaurant.tastepoint/obj.restaurant.count);
    $('#speed_point').append(obj.restaurant.speedpoint/obj.restaurant.count);
    $('#amount_point').append(obj.restaurant.amountpoint/obj.restaurant.count);
    $('#service_point').append(obj.restaurant.servicepoint/obj.restaurant.count);

    $('#res_profile tr:nth-child(6) td:nth-child(1)').append(obj.restaurant.resname);
    $('#res_profile tr:nth-child(7) td').append(obj.restaurant.phone);

////////////////////////////////////////////////////////////////////////////////////
    $('#supplement_box').append('<div id="ev_link"></div>');
    $('#supplement_box').append('<div id="menu_link"></div>');

    $('#ev_link').append('<p class="view_res_link">Evaluate</p>');
    $('#menu_link').append('<p class="view_res_link" id="menuPop">Menu</p>');

/////////////////////////////////////////////////////////////////////////

    $('#review_box').append('<table></table>');

    $('#review_box table').append('<tr></tr>');
    $('#review_box table').append('<tr></tr>');
    $('#review_box table').append('<tr></tr>');
    $('#review_box table').append('<tr></tr>');

    $('#review_box tr:nth-child(1)').append('<td class="table_name2">New Comment <a href="#">More</a></td>');
    $('#review_box tr:nth-child(2)').append('<td id="review_td" class="table_row0"></td>');
    $('#review_box tr:nth-child(3)').append('<td id="review_td" class="table_row1"></td>');
    $('#review_box tr:nth-child(4)').append('<td id="review_td" class="table_row0"></td>');
    for(var i = 0; i < obj.ev_temps.length; i++)  {
        $('#review_box tr:nth-child('+ (i+2) + ' ) td').append(obj.ev_temps[i].review);
    }

//////////////////////////////////////////////////////////////////////////

    $('#menuContact').append('<div id="menupane"></div>');
////////////////////////////////////////////////////////////////
    $('#menupane').append('<div id="orangebox_menu">Menu-'+obj.restaurant.resname+'<p id="popupContactClose1">x</p></div>');
    
    for(var i = 0; i< obj.menus.length; i++){
        $('#menupane').append('<table class="menu_table'+i%2+'"><tr><td class="menu_table_col1">'+obj.menus[i].menuname+'</td><td class="menu_table_col2">'+obj.menus[i].like+'</td></tr><td class="menu_table_col1">'+obj.menus[i].price+'</td><td class="menu_table_col2">'+obj.menus[i].dislike+'</td><tr></tr></table>');
    }

////////////////////////////////////////////////////////////
    $("#menuPop").click(function(){

            centerPopup('#menuContact');
            loadPopup('#menuContact');
        });
        $("#popupContactClose1").click(function(){
            disablePopup('#menuContact');
        });
        $('html').keydown(function(e){
                if(e.keyCode==27 && popupStatus==1){
                    $('#backgroundPopup').fadeOut("slow");
                    $('#menuContact').fadeOut("slow");
                    popupStatus = 0;
                } 
        });




}
///////////////////////////////////////////////////////////////


$(function() {
/*    var hash= window.location.hash;
    var args = hash.substr(1).split(";");

    var arg = args[0];
    var command = arg.split("=")[0];
    var res_id = arg.split("=")[1];

    if (command == "show") {
    }
*/

});
