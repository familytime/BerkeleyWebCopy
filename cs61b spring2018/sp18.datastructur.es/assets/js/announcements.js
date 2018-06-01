$("div.next").click(function(){
  var $toHighlight = $('.show').next().length > 0 ? $('.show').next() : $('li.announcement-item').first();
  var $curr = $('.show');
  $curr.removeClass('show');
  $curr.addClass('hide');
  $toHighlight.removeClass('hide');
  $toHighlight.addClass('show');
});

$("div.prev").click(function(){
  var $toHighlight = $('.show').prev().length > 0 ? $('.show').prev() : $('li.announcement-item').last();
  var $curr = $('.show');
  $curr.removeClass('show');
  $curr.addClass('hide');
  $toHighlight.removeClass('hide');
  $toHighlight.addClass('show');
});
