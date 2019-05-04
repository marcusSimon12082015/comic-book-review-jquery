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
