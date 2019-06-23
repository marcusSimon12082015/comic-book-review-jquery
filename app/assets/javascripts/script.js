$(document).on("turbolinks:load",function(){
  $('#comic_publisher_id').change(function(){
    $.ajax({
      method: 'GET',
      url: '/characters/update_characters',
      dataType: 'script',
      data:{ publisher_id: $('#comic_publisher_id :selected').val() }
    })
    .done(function(data){
      console.log('SUCCESS\n' + data);
    })
    .fail(function(){
      console.log('ERROR');
    })
    .always(function(){
      console.log('COMPLETE');
    });
  });

$("#new_comment").on('submit',function(e){
  e.preventDefault();
  var values = $(this).serialize();
  var url = $(e.target).attr('action');
  $.post(url,value,function(data){
    var comment = new Comment(data["id"],data["content"],data["user"]["email"]);
    $("#comment_content").val('');
    $("#comment-list").prepend(comment.renderListItem());
  })
  .fail(function(error){
    alert(error["responseText"]);
  })
  .always(function(){
    $(".add-to-collection").attr("disabled",false);
  });
});

$(".link-show").on('click',function(e){
  e.preventDefault();
  var href = $(this).attr("href");
  $.ajax({
    method:'GET',
    url:href,
    dataType:'json'
  })
  .done(function(data){
    var review = new Review(data["id"],data["title"],
                            data["content"],
                            data["user"]["email"],
                            data["links"]["next"],
                            data["links"]["previous"]);
    review.renderShow();
    $('#comments-list').empty();
    review.setComments(data["comments"]);
  });
});


  toastr.options = ({
   'closeButton': true,
   'debug': false,
   'positionClass': 'toast-bottom-right',
   'onclick': null,
   'showDuration': '300',
   'hideDuration': '1500',
   'timeOut': '5000',
   'extendedTimeOut': '1000',
   'showEasing': 'swing',
   'hideEasing': 'linear',
   'showMethod': 'fadeIn',
   'hideMethod': 'fadeOut'
   });

});
