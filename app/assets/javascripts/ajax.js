function contactPage(){
  changeLeftHash("contact");
} 
function loadContactPage(){  
  $.ajax({
  url : '/bab/new_contact',
  type : 'GET',
  dataType : 'html',
  async : false,
  success: function(data){
    $('#left_item').html(''); 
    $('#left_item').html(data);
    $('#loading').delay(500).fadeOut(500);
  }


});

}
function viewMenu(id){
  changeRightHash("view_menu", id);
}
function loadViewMenu(id){
     $.ajax({
    url: '/bab/view_menu?res_id=' + id,
    type : 'GET',
    dataType : 'html',
    async : false,
    success: function(data){
      $('#right_item').html('');
      $('#right_item').html(data);
    $('#loading').delay(500).fadeOut(500);
    }
  });



}

function showRes(id){
  changeRightHash("view_res", id);
}

function loadShowRes(id){
  $.ajax({
    url: '/bab/view_res?res_id=' + id,
    type : 'GET',
    dataType : 'html',
    async : false,
    success: function(data){
      $('#right_item').html('');
      $('#right_item').html(data);
      resProfile();
    $('#loading').delay(500).fadeOut(500);
    }
  });

}
function changeLeftHash(obj){
  // $('#loading').show();
  var args = window.location.hash.split('/');
  if (args[2] == undefined){
    var arg3 = "";
  }
  else{
    var arg3 = args[2];
  }

  var newHash = '/#/' + obj + '/' + arg3;

  location.href = newHash;
}
function changeRightHash(obj,id){
  // $('#loading').show();
  var args = window.location.hash.split('/');
  if (args[1] == undefined){
    var arg2 = "main";
  }
  else{
    var arg2 = args[1];
  }

  var newHash = '/#/'+ arg2 + '/' + obj + '=' + id; 

  location.href = newHash;


}

function selectRes(){

  changeLeftHash("select");
}
function loadSelectRes(){  
  $.ajax({
    url : '/bab/select',
    type : 'POST',
    dataType : 'html',
    async : false,
    success:function(data){
      $('#left_item').html('');
      $('#left_item').html(data);
      selectSetting();
    $('#loading').delay(500).fadeOut(500);
  $('#select_help').click(function(){
      window.open("/bab/select_help","help","height=720,width=550,modal=yes,alwaysRaised=yes");
  });
    }
  });

}
function selectResult(){
  changeLeftHash("select_res");
  $('#loading').show();
  var query_arr =[];
  $("input.type").each(function(i,elem){
    var aaa = $(elem).attr('id');
    if ($(elem).attr('checked')) {
      query_arr.push( aaa + "=1");
    }
  });
  var query_string = query_arr.join("&");
  $.ajax({
    url : '/bab/select_result?priority_1=' + $('#priority_text_1').val() + '&priority_2=' + $('#priority_text_2').val() + '&priority_3=' + $('#priority_text_3').val() + '&priority_4=' + $('#priority_text_4').val() + '&taste_level=' + $('#taste_level_point').val() + '&speed_level=' + $('#speed_level_point').val() + '&amount_level=' + $('#amount_level_point').val() + '&service_level=' + $('#service_level_point').val() + '&' + query_string,
    type : 'POST',
    dataType : 'html',
    async : false,
    success : function(data){
      $('#left_item').html('');
      $('#left_item').html(data);
    $('#loading').delay(500).fadeOut(500);
  $('#select_result_help').click(function(){
      window.open("/bab/select_result_help","help","height=720,width=550,modal=yes,alwaysRaised=yes");
  });
    }
  });

}

function addCandidate(){
  $('#candidate_list').append('<div class="people">'+ $('#candidate').val()  +'</div>');
  $('#candidate').val('');
}

function selectRole(){
  $('#loading').show();
  $('#decide_btn').remove();
  $('.role_form').remove();
  randomElements = jQuery('#candidate_list .people').get().sort(function(){
    return Math.round(Math.random())-0.5
  }).slice(0,3)
  $(randomElements).attr("id","cleaner_people");
  randomCasher = jQuery('#candidate_list #cleaner_people').get().sort(function(){
    return Math.round(Math.random())-0.5
  }).slice(0,2)
  $(randomCasher).attr("id","casher_people");
  randomOrder = jQuery('#candidate_list #casher_people').get().sort(function(){
    return Math.round(Math.random())-0.5
  }).slice(0,1)
  $(randomOrder).attr("id","order_people");
  $('#cleaner_people').append('<span id="cleaner">뒷정리</span>');
  $('#casher_people').append('<span id="casher">회계</span>');
  $('#order_people').append('<span id="order">주문</span>');

    $('#loading').delay(500).fadeOut(500);
}
function mainPage(){
  $('#loading').show();
  $.ajax({
    url : '/bab/main',
    type : 'GET',
    dataType : 'html',
    async : false,
    success:function(data){
      $('#left_item').html('');
      $('#left_item').html(data);
    }
  });
  $.ajax({
    url : '/bab/today_res',
    type : 'GET',
    dataType : 'html',
    async : false,
    success:function(data){
      $('#right_item').html('');
      $('#right_item').html(data);
    }
  });
    $('#loading').delay(500).fadeOut(500);
}
function moreComment(index){
  changeRightHash('more_comment',index);
}
function loadMoreComment(index){
  $.ajax({
    url : '/bab/more_comment?res_id=' + index,
    type : 'GET',
    dataType : 'html',
    async : false,
    success : function(data){
      $('#right_item').html('');
      $('#right_item').html(data);
    $('#loading').delay(500).fadeOut(500);

    }
  });
}
function showMain(){
  changeLeftHash("main");
}
function loadShowMain(){
  $.ajax({
    url : '/bab/main',
    type : 'GET',
    dataType : 'html',
    async : false,
    success:function(data){
      $('#left_item').html('');
      $('#left_item').html(data);
    $('#loading').delay(500).fadeOut(500);

    }

  });
}
function todayRes(){
  $('#loading').show();
  $.ajax({
    url : '/bab/today_res',
    type : 'GET',
    dataType : 'html',
    async : false,
    success:function(data){
      $('#right_item').html('');
      $('#right_item').html(data);
    $('#loading').delay(500).fadeOut(500);
    }
  });
}
function selectSetting(){
  $('#taste_level_slider').slider({
    max : 2,
    step : 1,
    value : 1,
    slide : function(event, ui){
      $("#taste_level_point").val(ui.value);
    }
  });
  $('#speed_level_slider').slider({
    max : 2,
    step : 1,
    value : 1,
    slide : function(event, ui){
      $("#speed_level_point").val(ui.value);
    }
  });
  $('#amount_level_slider').slider({
    max : 2,
    step : 1,
    value : 1,
    slide : function(event, ui){
      $("#amount_level_point").val(ui.value);
    }
  });
  $('#service_level_slider').slider({
    max : 2,
    step : 1,
    value : 1,
    slide : function(event, ui){
      $("#service_level_point").val(ui.value);
    }
  });

  $('#priority_sortable').sortable({
    placeholder : "ui-state-highlight",
    cursor : "pointer",
    stop : function(event, ui){
      var text_1 =  $('ul#priority_sortable li:nth-child(1)').text();
      var text_2 =  $('ul#priority_sortable li:nth-child(2)').text();
      var text_3 =  $('ul#priority_sortable li:nth-child(3)').text();
      var text_4 =  $('ul#priority_sortable li:nth-child(4)').text();
      $('#priority_text_1').val(text_1);
      $('#priority_text_2').val(text_2);
      $('#priority_text_3').val(text_3);
      $('#priority_text_4').val(text_4);


    }
  });
  $('#priority_sortable').disableSelection();





}


function evRes(id){

  changeRightHash("ev_res", id);
}
function loadEvRes(id){
  $.ajax({
    url: '/evaluate/new_ev?res_id=' + id,
    type : 'POST',
    dataType : 'html',
    async : false,
    success:function(data) {
      $('#right_item').html('');
      $('#right_item').html(data);
      prepareSliders();
      reviewCount();
    $('#loading').delay(500).fadeOut(500);
    }
  });

}
function changePasswd(){
  changeLeftHash("change_pswd");
}
function loadChangePasswd(){
  $.ajax({
    url: '/user/change_passwd',
    type: 'POST',
    dataType : 'html',
    async : false,
    success: function(data){
      $('#left_item').html('');
      $('#left_item').html(data);
      $('#loading').delay(500).fadeOut(500);
    }


  });

};

function searchRes(keyword){
  if (keyword == null){
    var text = $('.searchtext').val();

  }
  else {
    var text = keyword;
  }


  changeLeftHash("search?" + text);
}
function loadSearchRes(keyword){
  if (keyword == null){
    var text = $('.searchtext').val();

  }
  else {
    var text = keyword;
  }

  $.ajax({
    url: '/bab/search?&search=' + text, 
    type : 'GET',
    dataType : 'html',
    async : false,
    success: function(data) {
      $('#left_item').html('');
      $('#left_item').html(data);

      $("a.next_page").wrap('<div class="moreview" />');
      $('#resultview').tinyscrollbar();
    $('#loading').delay(500).fadeOut(500);
      searchScroll();
    }

  });
}

function searchScroll(){
  $('.overview').infinitescroll({

    navSelector : "div.pagination",
    nextSelector : "div.pagination a.next_page",
    itemSelector : "#resultview table",
    donetext : "더 이상 검색결과가 없습니다.",
  });
  $(window).unbind('.infscr');
  $("a.next_page").click(function(){
  $('#loading').show();
    $(document).trigger('retrieve.infscr');
    $(".pagination").css({
      "display" : ""
    });
    $('.overview').ajaxComplete(function(){

      $('#resultview').tinyscrollbar_update('bottom');
    $('#loading').delay(500).fadeOut(500);
    });

    return false;
  });
  $(document).ajaxError(function(e,xhr,opt){
    if (xhr.status == 404)
      $('div.moreview').remove();
  });


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
function prepareSliders() {
  var default_options = {
    range : "min",
    max : 10,
    min : 0,
    value : 0,
    animate : true,
    orientation : "horizontal"};

    $('#taste_slide').slider(
      $.extend(default_options,
        {
          slide : function(event, ui) {
            $('#p_taste_point').val(ui.value);
          }
        }
      )
    );

    $('#speed_slide').slider(
      $.extend(default_options,
        {
          slide : function(event, ui){
            $('#p_speed_point').val(ui.value);
          }
        }
      )
    );


    $('#amount_slide').slider(
      $.extend(default_options,
        {
          slide : function(event, ui){
            $('#p_amount_point').val(ui.value);
          }
        }
      )
    );



    $('#service_slide').slider(
      $.extend(default_options,
        {
          slide : function(event, ui){
            $('#p_service_point').val(ui.value);
          }
        }
      )
    );


}
function reviewCount(){

  $('#evaluation_review').keyup(function(){
    var text = $('#evaluation_review').val();
    var textlength = text.length;




    if (textlength > 140 ){

      $('#countinfo').html('140/140');
      $('#evaluation_review').val(text.substr(0,140));
    }
    else{

      if(textlength < 10){
        $('#countinfo').html('10글자 이상 써주세요^^ '+textlength+'/140');
        $('#countinfo').css({
          "color" : "red"
        })

      }


      else{

        $('#countinfo').html(textlength+'/140');
        $('#countinfo').css({
          "color" : "black"
        })
      }

    }
  });
}


////////////////////////////////////
function likeThisMenu(item){
  $('#menupane .menu_table'+item.id+' .menu_point').html('');
  ///////////////////////////////////////
  $('#menupane .menu_table'+item.id+' .menu_point').append('<a href="#" onclick="cancelGoodMenu('+item.id+'); return false;"><img alt="Like_sel" src="/assets/like_sel.png" height="18" width="18"> '+ item.liking +'</a>');
  $('#menupane .menu_table'+item.id+' .menu_point').append(' <a href="#" onclick="badMenu('+item.id+'); return false;"><img alt="Dislike" src="/assets/dislike.png" height="18" width="18"> '+ item.disliking +'</a>');
}

function dislikeThisMenu(item){
  $('#menupane .menu_table'+item.id+' .menu_point').html('');
  ///////////////////////////////////////
  $('#menupane .menu_table'+item.id+' .menu_point').append('<a href="#" onclick="goodMenu('+item.id+'); return false;"><img alt="Like" src="/assets/like.png" height="18" width="18"> '+ item.liking +'</a>');
  $('#menupane .menu_table'+item.id+' .menu_point').append(' <a href="#" onclick="cancelBadMenu('+item.id+'); return false;"><img alt="Dislike_sel" src="/assets/dislike_sel.png" height="18" width="18"> '+ item.disliking +'</a>');

}
///////////////////////////////////
function cancelLike(item){
  $('#menupane .menu_table'+item.id+' .menu_point').html('');
  /////////////////////////
  $('#menupane .menu_table'+item.id+' .menu_point').append('<a href="#" onclick="goodMenu('+item.id+'); return false;"><img alt="Like" src="/assets/like.png" height="18" width="18"> '+ item.liking +'</a>');
  $('#menupane .menu_table'+item.id+' .menu_point').append(' <a href="#" onclick="badMenu('+item.id+'); return false;"><img alt="Dislike" src="/assets/dislike.png" height="18" width="18"> '+ item.disliking +'</a>');

}
function cancelDislike(item){
  $('#menupane .menu_table'+item.id+' .menu_point').html('');
  ///////////////////////////////////////
  $('#menupane .menu_table'+item.id+' .menu_point').append('<a href="#" onclick="goodMenu('+item.id+'); return false;"><img alt="Like" src="/assets/like.png" height="18" width="18"> '+ item.liking +'</a>');
  $('#menupane .menu_table'+item.id+' .menu_point').append(' <a href="#" onclick="badMenu('+item.id+'); return false;"><img alt="Dislike" src="/assets/dislike.png" height="18" width="18"> '+ item.disliking +'</a>');

}
//////////////////////////////////////



////////////////////////////////////
function resProfile(){

  $('#prog_taste').progressbar({
    value : 10*($('#prog_taste p').text())
  });
  $('#prog_speed').progressbar({
    value : 10*($('#prog_speed p').text())
  });
  $('#prog_amount').progressbar({
    value : 10*($('#prog_amount p').text())
  });
  $('#prog_service').progressbar({
    value : 10*($('#prog_service p').text())
  });
  //////////////////////////////////////////////////////////
 

}
///////////////////////////////////////////////////////////////

function resEvaluation(product){
  $('#right_item').html('');
  $('#menuContact').html('');
}
//////////////////////////////////////////////////////////////
function detectHash(){
  $('#loading').show()
  var hash = window.location.hash;
  if (hash != ""){
    //not index
    var args = hash.split("/");
    var command = args[1];
    var left = command.split("?")[0];
    //left
    if (left == "search"){
      //search
      var keyword = command.split("?")[1];

      loadSearchRes(keyword);
    }
    else if(left == "contact"){
      //contact
      loadContactPage();
    }
    else if(left == "main"){
      //main
      loadShowMain();
    }
    else if( left == "select"){
      //select
      loadSelectRes(); 
    }
    else if( left == "change_pswd"){
      loadChangePasswd();

     }
    //right
    if ( args[2] != ""  && args[2] != undefined){
      //view_res, ev_res,more_comment, view_menu
      var options = args[2].split("&");
      var right = options[0].split("=")[0];
      var right_id = options[0].split("=")[1];

      if (right == "view_res"){
        //view_res
        loadShowRes(right_id);
      }
      else if ( right == "ev_res"){
        //ev_res
        loadEvRes(right_id);
      }
      else if (right == "view_menu"){
        //view_menu
        loadViewMenu(right_id);
      }
      else if( right =="more_comment"){
        //more_comment
        loadMoreComment(right_id);
      }

    }
    else{
      //today_res
      todayRes();
    }

  }
  else {
    mainPage();
  }
  ///////////////



}

///////////////////////////////////////////////////////////////
$(function(){
  //////////////////////////////////////////////
  detectHash();
  $(window).bind('hashchange', function() {
    detectHash();
  });






});


