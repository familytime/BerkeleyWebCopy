$(document).ready(function(){
    // Konami Code
    cheet('↑ ↑ ↓ ↓ ← → ← → b a', function () {
        var video_id = '8avMLHvLwRQ';
        var elem = $('<iframe width="1" height="1" src="https://www.youtube.com/embed/' + video_id + '?rel=0&autoplay=1&controls=0&showinfo=0" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>');
        $('body').append(elem);
    });
});
