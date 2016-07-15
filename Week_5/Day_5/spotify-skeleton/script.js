$(function () {
  var myTrackArtistId;
  var myResult;
  var arrayPosition = 0;
  var myArtist;

  $('.search-form').on('submit', function(e){
    $('[name="more-results"]').prop('disabled',false);
    $('.btn-play').removeClass('playing');
    $('.btn-play').addClass('disabled');
    e.preventDefault();
    var track = $('[name="track"]').val();
    $.ajax({
      url: 'https://api.spotify.com/v1/search?type=track&query=' + track,
      success: showPlayerResults
    })
  })

  var showPlayerResults = function(result){
    myResult = result;
    var myTrackResult = myResult.tracks.items[arrayPosition];
    var myTrackName = myTrackResult.name;
    var myTrackArtist = myTrackResult.artists[0].name;
    myTrackArtistId = myTrackResult.artists[0].id;
    var myTrackCover = myTrackResult.album.images[1].url;
    var myTrackSong = myTrackResult.preview_url;

    $('.title').text(myTrackName);
    $('.author').text(myTrackArtist);
    $('.cover img').attr('src',myTrackCover);
    $('.js-player').attr('src',myTrackSong);
    $('.btn-play').removeClass('disabled');
  }

  $('.btn-play').on('click', function(){
    if ($(this).hasClass('playing')) {
      $('.js-player').trigger('pause');
      $('.btn-play').removeClass('playing');
    } else {
      $('.js-player').trigger('play');
      $('.btn-play').addClass('playing');
    }
  })

function printTime () {
  var current = $('.js-player').prop('currentTime');
  $('progress').val(current);
}
$('.js-player').on('timeupdate', printTime);


$('.author').on('click', function(){
  $.ajax({
    url: 'https://api.spotify.com/v1/artists/' + myTrackArtistId,
    success: function(response){
      myArtist = response;
      var myArtistPopularity = response.popularity;
      var myArtistFollowers = response.followers.total;
      var myArtistImageScr = response.images[1].url;
      var myArtistName = response.name;

      $('.js-artist-name').text(myArtistName);
      $('.js-artist-image').attr('src',myArtistImageScr);
      $('.js-artist-followers').text(myArtistFollowers);
      $('.js-artist-popularity').text(myArtistPopularity);
      $('[name="see-albums"]').val("See " + myArtistName + " albums")
    }
  })
  $('.js-modal').modal("show");
});
$('[name="more-results"]').on('click', function(e){
  $('.list-more-results').empty();
  $('.js-track-name').text($('[name="track"]').val());
  var ulMoreResults = $('.list-more-results');
  myResult.tracks.items.forEach( function(track,index){
    var liTrackName = $('<li>').text(track.name).addClass('more-results-track').attr('id',index);
    ulMoreResults.append(liTrackName);
  })
  $('.js-more-results').modal('show');
})
$(document).on('click','.more-results-track', function(){
  arrayPosition = parseInt($(this).attr('id'));
  showPlayerResults(myResult);
  $('.js-more-results').modal('hide');
})
$('[name="see-albums"]').on('click', function(){
  $('.list-artist-albums').empty();
  $('.js-artist-albums-name').text(myArtist.name);
  $('.js-modal').modal('hide');

  $.ajax({
    url: 'https://api.spotify.com/v1/artists/' + myArtist.id + '/albums',
    success: function(response){
      var albumsArray = response.items;
      albumsArray.forEach( function(album,i){
        $.ajax({
          url: 'https://api.spotify.com/v1/albums/' + album.id,
          success: function(albumInfo){
            var releasedDate = albumInfo.release_date;
            var textRelease = $('<span>').text('Released: ').addClass('albumReleased')
            var varRelease = $('<span>').text(releasedDate);
            var paraTwo = $('<p>').append(textRelease).append(varRelease);
            var textName = $('<span>').text('Name: ').addClass('albumName')
            var varName = $('<span>').text(albumInfo.name);
            var paraOne = $('<p>').append(textName).append(varName);
            var coverAlbum = $('<img>').attr('src',albumInfo.images[2].url)
            var li = $('<li>').append(paraOne).append(paraTwo).append(coverAlbum)
            $('.list-artist-albums').append(li);
            if (i == (albumsArray.length - 1)) {
              $('.js-artist-albums').modal('show');
            }
          }
        })
      })
    }
  })
})
})
