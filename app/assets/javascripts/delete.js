$(document).on('turbolinks:load', function(){

  $('.content-delete-btn').click(function(){
    var alert = "確認\n削除すると２度と復活できません。\n本当に削除しますか？"
    if(!confirm(alert)){
      return false;
    }
  });
}); 