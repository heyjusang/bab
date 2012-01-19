function showRes(id){
    $.getJSON('/bab/view_res?res_id=' + id, resProfile)
}
function evRes(id){
    $.getJSON('/evaluate/new_ev?res_id=' +id, resEvaluation)
}
function goodMenu(id){
    $.getJSON('/evaluate/good_menu?menu_id=' +id, likeThisMenu)

}
function badMenu(id){
    $.getJSON('/evaluate/bad_menu?menu_id=' +id, dislikeThisMenu)
}

function cancelGoodMenu(id){
    $.getJSON('/evaluate/cancel_good?menu_id=' +id, cancelLike)

}

function cancelBadMenu(id){
    $.getJSON('/evaluate/cancel_bad?menu_id=' +id, cancelDislike)
}


////////////////////////////////////
function likeThisMenu(item){
    $('#menupane .menu_table'+item.id+' #like_td').html('');
    $('#menupane .menu_table'+item.id+' #like_count_td').html('');
    $('#menupane .menu_table'+item.id+' #dislike_td').html('');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').html('');
   ///////////////////////////////////////
    $('#menupane .menu_table'+item.id+' #like_td').append('<a href="#" onclick="cancelGoodMenu('+item.id+');return false;">cancel</a>');
    $('#menupane .menu_table'+item.id+' #like_count_td').append(item.like);
    $('#menupane .menu_table'+item.id+' #dislike_td').append('<a href="#" onclick="badMenu('+item.id+');return false;">dislike</a>');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').append(item.dislike);
}

function dislikeThisMenu(item){
    $('#menupane .menu_table'+item.id+' #like_td').html('');
    $('#menupane .menu_table'+item.id+' #like_count_td').html('');
    $('#menupane .menu_table'+item.id+' #dislike_td').html('');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').html('');
   ///////////////////////////////////////
    $('#menupane .menu_table'+item.id+' #like_td').append('<a href="#" onclick="goodMenu('+item.id+');return false;">like</a>');
    $('#menupane .menu_table'+item.id+' #like_count_td').append(item.like);
    $('#menupane .menu_table'+item.id+' #dislike_td').append('<a href="#" onclick="cancelBadMenu('+item.id+');return false;">cancel</a>');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').append(item.dislike);

}
///////////////////////////////////
function cancelLike(item){
    $('#menupane .menu_table'+item.id+' #like_td').html('');
    $('#menupane .menu_table'+item.id+' #like_count_td').html('');
    /////////////////////////
    $('#menupane .menu_table'+item.id+' #like_td').append('<a href="#" onclick="goodMenu('+item.id+');return false;">like</a>');
    $('#menupane .menu_table'+item.id+' #like_count_td').append(item.like);

}
function cancelDislike(item){
    $('#menupane .menu_table'+item.id+' #dislike_td').html('');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').html('');
   ///////////////////////////////////////
    $('#menupane .menu_table'+item.id+' #dislike_td').append('<a href="#" onclick="badMenu('+item.id+');return false;">dislike</a>');
    $('#menupane .menu_table'+item.id+' #dislike_count_td').append(item.dislike);

}
////////////////////////////////////
function resProfile(obj){
    $('#right_item').html('');
    $('#menuContact').html('');
    $('#menuContact').remove();
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

    $('#taste_point').append('<div id="prog_taste"></div>');
    $('#speed_point').append('<div id="prog_speed"></div>');
    $('#amount_point').append('<div id="prog_amount"></div>');
    $('#service_point').append('<div id="prog_service"></div>');
    $('#prog_taste').progressbar({
        value : 10*((obj.restaurant.tastepoint/obj.restaurant.count).toFixed(2))
        });
    $('#prog_speed').progressbar({
        value : 10*((obj.restaurant.speedpoint/obj.restaurant.count).toFixed(2))
        });
    $('#prog_amount').progressbar({
        value : 10*((obj.restaurant.amountpoint/obj.restaurant.count).toFixed(2))
        });
    $('#prog_service').progressbar({
        value : 10*((obj.restaurant.servicepoint/obj.restaurant.count).toFixed(2))
        });
    $('#prog_taste').append('<p>'+(obj.restaurant.tastepoint/obj.restaurant.count).toFixed(2)+'</p>');
    $('#prog_speed').append('<p>'+(obj.restaurant.speedpoint/obj.restaurant.count).toFixed(2)+'</p>');
    $('#prog_amount').append('<p>'+(obj.restaurant.amountpoint/obj.restaurant.count).toFixed(2)+'</p>');
    $('#prog_service').append('<p>'+(obj.restaurant.servicepoint/obj.restaurant.count).toFixed(2)+'</p>');
    $('#res_profile tr:nth-child(6) td:nth-child(1)').append(obj.restaurant.resname);
    $('#res_profile tr:nth-child(7) td').append(obj.restaurant.phone);

////////////////////////////////////////////////////////////////////////////////////
    $('#supplement_box').append('<div id="ev_link"></div>');
    $('#supplement_box').append('<div id="menu_link"></div>');

    $('#ev_link').append('<a href="#" onclick="evRes('+obj.restaurant.id+');return false;" class="view_res_link">Evaluate</a>');
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
        $('"#review_box tr:nth-child('+ (i+2) + ' ) td"').append(obj.ev_temps[i].review);
    }

//////////////////////////////////////////////////////////////////////////

    $('#menuContact').append('<div id="menupane"></div>');
////////////////////////////////////////////////////////////////
    $('#menupane').append('<div id="orangebox_menu">Menu-'+obj.restaurant.resname+'<p id="popupContactClose1">x</p></div>');
    
    for(var i = 0; i< obj.menus.length; i++){
        
        if(obj.menus[i].goodbad == null){
            $('#menupane').append('<table class="menu_table'+(obj.menus[i].menu.id)+'"><tr><td class="menu_table_col1">'+obj.menus[i].menu.menuname+'</td><td class="menu_table_col2" id="like_td"><a href="#" onclick="goodMenu('+obj.menus[i].menu.id+');return false;">like</a></td><td class="menu_table_col3" id="like_count_td">'+obj.menus[i].menu.like+'</td></tr><td class="menu_table_col1">'+obj.menus[i].menu.price+'</td><td class="menu_table_col2" id="dislike_td"><a href="#" onclick="badMenu('+obj.menus[i].menu.id+');return false;">dislike</a></td><td class="menu_table_col3" id="dislike_count_td">'+obj.menus[i].menu.dislike+'</td></table>');
        }
        else {



            if(obj.menus[i].goodbad.good == true && obj.menus[i].goodbad.bad == false){
            $('#menupane').append('<table class="menu_table'+(obj.menus[i].menu.id)+'"><tr><td class="menu_table_col1">'+obj.menus[i].menu.menuname+'</td><td class="menu_table_col2" id="like_td"><a href="#" onclick="cancelGoodMenu('+obj.menus[i].menu.id+');return false;">cancel</a></td><td class="menu_table_col3" id="like_count_td">'+obj.menus[i].menu.like+'</td></tr><td class="menu_table_col1">'+obj.menus[i].menu.price+'</td><td class="menu_table_col2" id="dislike_td"><a href="#" onclick="badMenu('+obj.menus[i].menu.id+');return false;">dislike</a></td><td class="menu_table_col3" id="dislike_count_td">'+obj.menus[i].menu.dislike+'</td></table>');
            }
            else if(obj.menus[i].goodbad.bad == true && obj.menus[i].goodbad.good == true){
            $('#menupane').append('<table class="menu_table'+(obj.menus[i].menu.id)+'"><tr><td class="menu_table_col1">'+obj.menus[i].menu.menuname+'</td><td class="menu_table_col2" id="like_td"><a href="#" onclick="goodMenu('+obj.menus[i].menu.id+');return false;">like</a></td><td class="menu_table_col3" id="like_count_td">'+obj.menus[i].menu.like+'</td></tr><td class="menu_table_col1">'+obj.menus[i].menu.price+'</td><td class="menu_table_col2" id="dislike_td"><a href="#" onclick="cancelBadMenu('+obj.menus[i].menu.id+');return false;">cancel</a></td><td class="menu_table_col3" id="dislike_count_td">'+obj.menus[i].menu.dislike+'</td></table>');
            }
            else if(obj.menus[i].goodbad.bad == false && obj.menus[i].goodbad.good == false){
            $('#menupane').append('<table class="menu_table'+(obj.menus[i].menu.id)+'"><tr><td class="menu_table_col1">'+obj.menus[i].menu.menuname+'</td><td class="menu_table_col2" id="like_td"><a href="#" onclick="goodMenu('+obj.menus[i].menu.id+');return false;">like</a></td><td class="menu_table_col3" id="like_count_td">'+obj.menus[i].menu.like+'</td></tr><td class="menu_table_col1">'+obj.menus[i].menu.price+'</td><td class="menu_table_col2" id="dislike_td"><a href="#" onclick="badMenu('+obj.menus[i].menu.id+');return false;">dislike</a></td><td class="menu_table_col3" id="dislike_count_td">'+obj.menus[i].menu.dislike+'</td></table>');
            }
        }
    
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

function resEvaluation(product){
    $('#right_item').html('');
    $('#menuContact').html('');
}



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
