$(document).ready( function(){

  $('.search').on('submit', function(e){
    e.preventDefault();
    $('.results').empty();
    var artist = $('.artistsearch').val();


    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/search?type=artist&query=' + artist,
      success: function (response) {
        console.log('in da success');
        var results = response.artists.items;
        results.forEach( function(element){
          var ptext = $('<p>').text(element.name);
          var alink = $('<a>').attr('href',element.id).addClass("artist").append(ptext);

          if (element.images[1] != undefined) {
            var image = $('<img>').attr('src',element.images[1].url);
          }
          $('.results').append(alink);
          $('.results').append(image);

        })

      },
      error: function (err) {
        console.log('in da error');
      }
    })
  })

  $(document).on('click','.artist', function(e){
    e.preventDefault();
    $('.albums').empty();
    var idartist = $(this).attr('href');
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/artists/' + idartist + '/albums',
      success: function (response) {

        var results = response.items;
        results.forEach( function(element){
          var ptext = $('<p>').text(element.name);
          var alink = $('<a>').attr('href',element.id).addClass("album").append(ptext);

          if (element.images[1] != undefined) {
            var image = $('<img>').attr('src',element.images[1].url);
          }
          $('.albums').append(alink);
          $('.albums').append(image);

        })
      },
      error: function (err) {
        console.log('in da error');
      }
    })
  })
  $(document).on('click','.album', function(e){
    e.preventDefault();
    $('.tracks').empty();
    var idalbum = $(this).attr('href');
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/albums/' + idalbum + '/tracks',
      success: function (response) {

        var results = response.items;
        results.forEach( function(element){
        var ptext = $('<p>').text(element.name);
        var alink = $('<a>').attr('href',element.preview_url).attr('target','_blank').append(ptext);

         $('.tracks').append(alink);
       })
      },
      error: function (err) {
        console.log('in da error');
      }
    })
  })
})
