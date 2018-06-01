
$(document).ready(function(){
  var ll = new LazyLoad({
    threshold: 0
  });

  $('.photo1').mouseenter(function() {
      var parent2 = $(this).parent().find('.photo2');
      $(this).hide();
      parent2.show();
      parent2.mouseleave(function() {
          $(this).hide();
          $(this).parent().find('.photo1').show();
      })
      ll.update();
  });

  $('.photo2').click(function() {
      var parent3 = $(this).parent().find('.photo3');
      if (parent3.length) {
          $(this).unbind('mouseleave');
          parent3.show();
          $(this).hide();
          parent3.mouseleave(function() {
              $(this).hide();
              $(this).parent().find('.photo1').show();
          })
      }
      ll.update();
  });

  $('.photo2,  .photo3').contextmenu(function() {
      var parent4 = $(this).parent().find('.photo4');
      if (parent4.length) {
          $(this).unbind('mouseleave');
          $(this).hide();
          parent4.show();
          ll.update();
      }
  });

  $('.photo4').mouseleave(function() {
      $(this).parent().find('.photo1').show();
      $(this).hide();
  });

  $('#josh-email-trigger').click(function(e) {
    if ($('#josh-email').is(":visible")) {
      $('#josh-email').fadeOut(200);
    } else {
      $('#josh-email').fadeIn(200);
    }
  });
});
